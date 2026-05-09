; DESCRIPTION: Composite: Sets a single white pixel at (359, 99) then Renders a purple line between points (42, 3) and (194, 66).
; PLAN: r0=359(x), r1=99(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=42(x1), r6=3(y1), r7=194(x2), r8=66(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 99
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 42
LDI r6, 3
LDI r7, 194
LDI r8, 66
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
