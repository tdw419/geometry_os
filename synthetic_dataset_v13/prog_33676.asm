; DESCRIPTION: Draws a blue rectangle at (324, 100) with width 33 and height 12.
; PLAN: r0=324(x), r1=100(y), r2=33(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 100
LDI r2, 33
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
