; DESCRIPTION: Composite: Places a yellow dot at position (163, 106) then Renders a purple disk with center (420, 92) and radius 11.
; PLAN: r0=163(x), r1=106(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=420(x), r6=92(y), r7=11(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 163
LDI r1, 106
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 420
LDI r6, 92
LDI r7, 11
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
