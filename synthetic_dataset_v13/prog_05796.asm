; DESCRIPTION: Composite: Sets a single purple pixel at (158, 152) then Places a magenta line segment connecting (358, 250) to (245, 208).
; PLAN: r0=158(x), r1=152(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=358(x1), r6=250(y1), r7=245(x2), r8=208(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 158
LDI r1, 152
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 358
LDI r6, 250
LDI r7, 245
LDI r8, 208
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
