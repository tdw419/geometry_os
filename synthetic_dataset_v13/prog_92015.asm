; DESCRIPTION: Composite: Sets a single white pixel at (297, 212) then Renders a purple line between points (412, 14) and (23, 204).
; PLAN: r0=297(x), r1=212(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=412(x1), r6=14(y1), r7=23(x2), r8=204(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 297
LDI r1, 212
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 412
LDI r6, 14
LDI r7, 23
LDI r8, 204
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
