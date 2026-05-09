; DESCRIPTION: Composite: Places a cyan dot at position (405, 217) then Renders a blue disk with center (318, 162) and radius 80.
; PLAN: r0=405(x), r1=217(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=318(x), r6=162(y), r7=80(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 405
LDI r1, 217
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 318
LDI r6, 162
LDI r7, 80
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
