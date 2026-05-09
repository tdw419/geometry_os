; DESCRIPTION: Composite: Sets a single magenta pixel at (374, 191) then Renders a purple line between points (444, 194) and (409, 194).
; PLAN: r0=374(x), r1=191(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=444(x1), r6=194(y1), r7=409(x2), r8=194(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 374
LDI r1, 191
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 444
LDI r6, 194
LDI r7, 409
LDI r8, 194
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
