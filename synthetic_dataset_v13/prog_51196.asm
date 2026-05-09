; DESCRIPTION: Composite: Places a magenta line segment connecting (200, 134) to (252, 223) then Sets a single green pixel at (510, 51).
; PLAN: r0=200(x1), r1=134(y1), r2=252(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=510(x), r6=51(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 200
LDI r1, 134
LDI r2, 252
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 510
LDI r6, 51
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
