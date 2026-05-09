; DESCRIPTION: Composite: Places a white line segment connecting (372, 110) to (49, 112) then Sets a single white pixel at (302, 183).
; PLAN: r0=372(x1), r1=110(y1), r2=49(x2), r3=112(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=302(x), r6=183(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 372
LDI r1, 110
LDI r2, 49
LDI r3, 112
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 183
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
