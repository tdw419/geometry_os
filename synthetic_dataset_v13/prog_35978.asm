; DESCRIPTION: Composite: Places a magenta line segment connecting (215, 189) to (129, 79) then Sets a single red pixel at (116, 177).
; PLAN: r0=215(x1), r1=189(y1), r2=129(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=116(x), r6=177(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 215
LDI r1, 189
LDI r2, 129
LDI r3, 79
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 177
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
