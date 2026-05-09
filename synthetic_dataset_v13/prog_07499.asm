; DESCRIPTION: Composite: Draws a magenta line from (72, 9) to (26, 202) then Sets a single yellow pixel at (257, 168).
; PLAN: r0=72(x1), r1=9(y1), r2=26(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=257(x), r6=168(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 72
LDI r1, 9
LDI r2, 26
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 168
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
