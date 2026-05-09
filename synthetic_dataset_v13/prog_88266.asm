; DESCRIPTION: Renders a magenta disk with center (482, 192) and radius 22.
; PLAN: r0=482(x), r1=192(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 482
LDI r1, 192
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
