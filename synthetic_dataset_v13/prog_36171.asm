; DESCRIPTION: Composite: Places a magenta dot at position (138, 61) then Places a purple line segment connecting (307, 169) to (133, 160).
; PLAN: r0=138(x), r1=61(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=307(x1), r6=169(y1), r7=133(x2), r8=160(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 138
LDI r1, 61
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 307
LDI r6, 169
LDI r7, 133
LDI r8, 160
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
