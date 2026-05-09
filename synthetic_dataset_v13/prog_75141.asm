; DESCRIPTION: Draws a purple rectangle at (237, 124) with width 59 and height 33.
; PLAN: r0=237(x), r1=124(y), r2=59(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 124
LDI r2, 59
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
