; DESCRIPTION: Renders a yellow disk with center (386, 179) and radius 60.
; PLAN: r0=386(x), r1=179(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 179
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
