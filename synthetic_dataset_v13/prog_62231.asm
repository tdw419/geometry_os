; DESCRIPTION: Composite: Sets a single magenta pixel at (269, 41) then Places a purple line segment connecting (406, 163) to (266, 39).
; PLAN: r0=269(x), r1=41(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=406(x1), r6=163(y1), r7=266(x2), r8=39(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 269
LDI r1, 41
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 406
LDI r6, 163
LDI r7, 266
LDI r8, 39
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
