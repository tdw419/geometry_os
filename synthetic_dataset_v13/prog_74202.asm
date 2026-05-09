; DESCRIPTION: Composite: Places a yellow dot at position (15, 219) then Renders a purple disk with center (80, 74) and radius 44.
; PLAN: r0=15(x), r1=219(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=80(x), r6=74(y), r7=44(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 15
LDI r1, 219
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 80
LDI r6, 74
LDI r7, 44
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
