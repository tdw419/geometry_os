; DESCRIPTION: Draws a orange rectangle at (365, 117) with width 116 and height 91.
; PLAN: r0=365(x), r1=117(y), r2=116(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 117
LDI r2, 116
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
