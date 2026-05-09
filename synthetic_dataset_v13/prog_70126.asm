; DESCRIPTION: Composite: Places a purple circle of radius 40 at center (330, 114) then Sets a single yellow pixel at (455, 143) then Draws a white line from (80, 54) to (7, 82).
; PLAN: r0=330(x), r1=114(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=455(x), r6=143(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=80(x1), r11=54(y1), r12=7(x2), r13=82(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 330
LDI r1, 114
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 455
LDI r6, 143
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 80
LDI r11, 54
LDI r12, 7
LDI r13, 82
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
