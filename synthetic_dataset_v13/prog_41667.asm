; DESCRIPTION: Composite: Draws a magenta line from (265, 227) to (305, 214) then Sets a single black pixel at (145, 149).
; PLAN: r0=265(x1), r1=227(y1), r2=305(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=145(x), r6=149(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 265
LDI r1, 227
LDI r2, 305
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 149
LDI r7, 0x000000
PSET r5, r6, r7
HALT
