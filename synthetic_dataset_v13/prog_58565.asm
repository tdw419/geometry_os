; DESCRIPTION: Draws a red rectangle at (288, 1) with width 37 and height 84.
; PLAN: r0=288(x), r1=1(y), r2=37(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 1
LDI r2, 37
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
