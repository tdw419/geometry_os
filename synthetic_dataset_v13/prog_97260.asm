; DESCRIPTION: Composite: Places a purple dot at position (133, 93) then Renders a yellow disk with center (93, 150) and radius 80.
; PLAN: r0=133(x), r1=93(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=93(x), r6=150(y), r7=80(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 133
LDI r1, 93
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 93
LDI r6, 150
LDI r7, 80
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
