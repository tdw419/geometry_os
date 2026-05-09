; DESCRIPTION: Composite: Sets a single red pixel at (186, 114) then Renders a blue disk with center (354, 120) and radius 70.
; PLAN: r0=186(x), r1=114(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=354(x), r6=120(y), r7=70(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 186
LDI r1, 114
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 354
LDI r6, 120
LDI r7, 70
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
