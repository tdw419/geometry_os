; DESCRIPTION: Composite: Sets a single magenta pixel at (433, 56) then Renders a red line between points (337, 227) and (44, 221).
; PLAN: r0=433(x), r1=56(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=337(x1), r6=227(y1), r7=44(x2), r8=221(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 433
LDI r1, 56
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 337
LDI r6, 227
LDI r7, 44
LDI r8, 221
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
