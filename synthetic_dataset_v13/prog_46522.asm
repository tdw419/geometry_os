; DESCRIPTION: Composite: Sets a single purple pixel at (203, 201) then Renders a magenta line between points (304, 140) and (113, 238).
; PLAN: r0=203(x), r1=201(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=304(x1), r6=140(y1), r7=113(x2), r8=238(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 203
LDI r1, 201
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 304
LDI r6, 140
LDI r7, 113
LDI r8, 238
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
