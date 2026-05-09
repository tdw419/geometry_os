; DESCRIPTION: Draws a blue rectangle at (121, 105) with width 48 and height 92.
; PLAN: r0=121(x), r1=105(y), r2=48(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 105
LDI r2, 48
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
