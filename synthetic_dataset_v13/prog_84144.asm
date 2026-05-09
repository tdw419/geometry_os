; DESCRIPTION: Composite: Sets a single white pixel at (104, 58) then Renders a purple line between points (168, 185) and (98, 62).
; PLAN: r0=104(x), r1=58(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=168(x1), r6=185(y1), r7=98(x2), r8=62(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 104
LDI r1, 58
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 168
LDI r6, 185
LDI r7, 98
LDI r8, 62
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
