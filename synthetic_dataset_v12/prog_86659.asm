; DESCRIPTION: Composite: Draws a black line from (391, 137) to (303, 107) then Sets a single white pixel at (189, 178).
; PLAN: r0=391(x1), r1=137(y1), r2=303(x2), r3=107(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=189(x), r6=178(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 391
LDI r1, 137
LDI r2, 303
LDI r3, 107
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 178
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
