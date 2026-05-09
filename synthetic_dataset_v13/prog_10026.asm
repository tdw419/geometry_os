; DESCRIPTION: Renders a yellow disk with center (467, 48) and radius 18.
; PLAN: r0=467(x), r1=48(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 467
LDI r1, 48
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
