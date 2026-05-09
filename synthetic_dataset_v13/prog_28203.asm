; DESCRIPTION: Composite: Sets a single magenta pixel at (163, 142) then Draws a purple line from (107, 53) to (128, 105).
; PLAN: r0=163(x), r1=142(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=107(x1), r6=53(y1), r7=128(x2), r8=105(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 163
LDI r1, 142
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 107
LDI r6, 53
LDI r7, 128
LDI r8, 105
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
