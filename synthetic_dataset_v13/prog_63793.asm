; DESCRIPTION: Composite: Draws a magenta line from (325, 214) to (71, 143) then Sets a single white pixel at (66, 89).
; PLAN: r0=325(x1), r1=214(y1), r2=71(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=66(x), r6=89(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 325
LDI r1, 214
LDI r2, 71
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 89
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
