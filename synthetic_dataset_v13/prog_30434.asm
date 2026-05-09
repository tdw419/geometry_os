; DESCRIPTION: Draws a purple rectangle at (415, 20) with width 22 and height 83.
; PLAN: r0=415(x), r1=20(y), r2=22(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 20
LDI r2, 22
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
