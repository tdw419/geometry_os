; DESCRIPTION: Composite: Sets a single blue pixel at (103, 193) then Renders a purple line between points (57, 188) and (435, 140).
; PLAN: r0=103(x), r1=193(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=57(x1), r6=188(y1), r7=435(x2), r8=140(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 193
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 57
LDI r6, 188
LDI r7, 435
LDI r8, 140
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
