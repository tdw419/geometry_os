; DESCRIPTION: Places a blue circle of radius 56 at center (188, 192).
; PLAN: r0=188(x), r1=192(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 192
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
