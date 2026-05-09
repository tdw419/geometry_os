; DESCRIPTION: Composite: Draws a yellow line from (466, 182) to (78, 5) then Sets a single red pixel at (115, 19) then Places a magenta circle of radius 59 at center (109, 165).
; PLAN: r0=466(x1), r1=182(y1), r2=78(x2), r3=5(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=19(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=109(x), r11=165(y), r12=59(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 466
LDI r1, 182
LDI r2, 78
LDI r3, 5
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 19
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 109
LDI r11, 165
LDI r12, 59
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
