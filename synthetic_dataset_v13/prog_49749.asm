; DESCRIPTION: Draws a blue circle centered at (192, 206) with radius 28.
; PLAN: r0=192(x), r1=206(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 206
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
