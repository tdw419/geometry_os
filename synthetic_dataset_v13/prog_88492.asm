; DESCRIPTION: Renders a yellow disk with center (339, 127) and radius 32.
; PLAN: r0=339(x), r1=127(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 127
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
