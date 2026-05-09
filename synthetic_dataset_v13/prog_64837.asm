; DESCRIPTION: Composite: Draws a black line from (174, 246) to (70, 132) then Sets a single yellow pixel at (455, 3).
; PLAN: r0=174(x1), r1=246(y1), r2=70(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=455(x), r6=3(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 174
LDI r1, 246
LDI r2, 70
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 3
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
