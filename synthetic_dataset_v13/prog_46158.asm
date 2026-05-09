; DESCRIPTION: Draws a blue rectangle at (288, 48) with width 18 and height 112.
; PLAN: r0=288(x), r1=48(y), r2=18(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 48
LDI r2, 18
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
