; DESCRIPTION: Composite: Places a magenta dot at position (325, 136) then Draws a magenta line from (441, 33) to (186, 151).
; PLAN: r0=325(x), r1=136(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=441(x1), r6=33(y1), r7=186(x2), r8=151(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 325
LDI r1, 136
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 441
LDI r6, 33
LDI r7, 186
LDI r8, 151
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
