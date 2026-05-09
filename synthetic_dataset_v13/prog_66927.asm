; DESCRIPTION: Composite: Places a purple line segment connecting (372, 54) to (406, 189) then Sets a single white pixel at (335, 165).
; PLAN: r0=372(x1), r1=54(y1), r2=406(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=335(x), r6=165(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 372
LDI r1, 54
LDI r2, 406
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 165
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
