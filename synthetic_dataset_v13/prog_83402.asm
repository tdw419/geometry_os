; DESCRIPTION: Draws a orange rectangle at (24, 116) with width 76 and height 76.
; PLAN: r0=24(x), r1=116(y), r2=76(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 116
LDI r2, 76
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
