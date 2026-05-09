; DESCRIPTION: Composite: Places a yellow line segment connecting (102, 68) to (391, 13) then Sets a single white pixel at (247, 69).
; PLAN: r0=102(x1), r1=68(y1), r2=391(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=247(x), r6=69(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 102
LDI r1, 68
LDI r2, 391
LDI r3, 13
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 69
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
