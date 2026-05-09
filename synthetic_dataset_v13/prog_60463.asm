; DESCRIPTION: Draws a blue rectangle at (237, 63) with width 111 and height 80.
; PLAN: r0=237(x), r1=63(y), r2=111(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 63
LDI r2, 111
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
