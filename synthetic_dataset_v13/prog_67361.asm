; DESCRIPTION: Draws a orange rectangle at (151, 10) with width 117 and height 76.
; PLAN: r0=151(x), r1=10(y), r2=117(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 10
LDI r2, 117
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
