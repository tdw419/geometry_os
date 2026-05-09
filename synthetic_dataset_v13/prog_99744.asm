; DESCRIPTION: Composite: Places a magenta dot at position (168, 216) then Renders a purple line between points (459, 179) and (11, 26).
; PLAN: r0=168(x), r1=216(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=459(x1), r6=179(y1), r7=11(x2), r8=26(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 168
LDI r1, 216
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 459
LDI r6, 179
LDI r7, 11
LDI r8, 26
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
