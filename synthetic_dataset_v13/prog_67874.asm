; DESCRIPTION: Composite: Draws a magenta line from (49, 118) to (81, 131) then Sets a single white pixel at (301, 216) then Draws a yellow circle centered at (334, 197) with radius 25.
; PLAN: r0=49(x1), r1=118(y1), r2=81(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=216(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=334(x), r11=197(y), r12=25(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 49
LDI r1, 118
LDI r2, 81
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 216
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 334
LDI r11, 197
LDI r12, 25
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
