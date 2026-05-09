; DESCRIPTION: Composite: Sets a single yellow pixel at (337, 103) then Renders a black disk with center (420, 119) and radius 79.
; PLAN: r0=337(x), r1=103(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=420(x), r6=119(y), r7=79(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 337
LDI r1, 103
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 420
LDI r6, 119
LDI r7, 79
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
