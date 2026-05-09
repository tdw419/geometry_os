; DESCRIPTION: Draws a purple rectangle at (260, 226) with width 59 and height 20.
; PLAN: r0=260(x), r1=226(y), r2=59(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 226
LDI r2, 59
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
