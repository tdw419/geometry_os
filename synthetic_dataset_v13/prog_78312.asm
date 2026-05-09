; DESCRIPTION: Draws a purple rectangle at (393, 222) with width 111 and height 27.
; PLAN: r0=393(x), r1=222(y), r2=111(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 222
LDI r2, 111
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
