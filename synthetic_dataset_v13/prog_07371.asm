; DESCRIPTION: Composite: Sets a single purple pixel at (293, 48) then Renders a purple line between points (468, 47) and (372, 244).
; PLAN: r0=293(x), r1=48(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=468(x1), r6=47(y1), r7=372(x2), r8=244(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 293
LDI r1, 48
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 468
LDI r6, 47
LDI r7, 372
LDI r8, 244
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
