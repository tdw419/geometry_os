; DESCRIPTION: Renders a purple disk with center (218, 147) and radius 68.
; PLAN: r0=218(x), r1=147(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 147
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
