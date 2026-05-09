; DESCRIPTION: Composite: Places a yellow line segment connecting (380, 218) to (187, 185) then Sets a single black pixel at (132, 232).
; PLAN: r0=380(x1), r1=218(y1), r2=187(x2), r3=185(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=132(x), r6=232(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 380
LDI r1, 218
LDI r2, 187
LDI r3, 185
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 232
LDI r7, 0x000000
PSET r5, r6, r7
HALT
