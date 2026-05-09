; DESCRIPTION: Renders a yellow disk with center (307, 147) and radius 16.
; PLAN: r0=307(x), r1=147(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 307
LDI r1, 147
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
