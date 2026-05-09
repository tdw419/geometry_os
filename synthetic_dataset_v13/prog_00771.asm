; DESCRIPTION: Composite: Sets a single red pixel at (202, 38) then Renders a purple line between points (45, 250) and (372, 227).
; PLAN: r0=202(x), r1=38(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=45(x1), r6=250(y1), r7=372(x2), r8=227(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 38
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 45
LDI r6, 250
LDI r7, 372
LDI r8, 227
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
