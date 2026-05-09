; DESCRIPTION: Composite: Places a purple circle of radius 19 at center (140, 226) then Sets a single yellow pixel at (102, 31) then Draws a white line from (471, 117) to (175, 190).
; PLAN: r0=140(x), r1=226(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=102(x), r6=31(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=471(x1), r11=117(y1), r12=175(x2), r13=190(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 140
LDI r1, 226
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 102
LDI r6, 31
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 471
LDI r11, 117
LDI r12, 175
LDI r13, 190
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
