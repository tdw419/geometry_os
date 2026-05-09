; DESCRIPTION: Composite: Draws a magenta line from (468, 204) to (416, 99) then Sets a single blue pixel at (71, 89).
; PLAN: r0=468(x1), r1=204(y1), r2=416(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=89(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 468
LDI r1, 204
LDI r2, 416
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 89
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
