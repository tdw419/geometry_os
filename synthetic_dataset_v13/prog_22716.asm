; DESCRIPTION: Composite: Places a blue dot at position (468, 200) then Renders a yellow disk with center (73, 128) and radius 73.
; PLAN: r0=468(x), r1=200(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=73(x), r6=128(y), r7=73(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 468
LDI r1, 200
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 73
LDI r6, 128
LDI r7, 73
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
