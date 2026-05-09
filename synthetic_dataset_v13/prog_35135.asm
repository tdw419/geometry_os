; DESCRIPTION: Composite: Sets a single white pixel at (505, 174) then Renders a purple line between points (189, 56) and (355, 146).
; PLAN: r0=505(x), r1=174(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=189(x1), r6=56(y1), r7=355(x2), r8=146(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 505
LDI r1, 174
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 189
LDI r6, 56
LDI r7, 355
LDI r8, 146
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
