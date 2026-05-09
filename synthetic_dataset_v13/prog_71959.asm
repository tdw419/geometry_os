; DESCRIPTION: Draws a blue rectangle at (29, 40) with width 36 and height 92.
; PLAN: r0=29(x), r1=40(y), r2=36(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 40
LDI r2, 36
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
