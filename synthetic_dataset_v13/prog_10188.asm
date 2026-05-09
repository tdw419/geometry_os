; DESCRIPTION: Composite: Draws a red line from (175, 37) to (288, 198) then Sets a single purple pixel at (266, 50) then Draws a magenta circle centered at (368, 167) with radius 48.
; PLAN: r0=175(x1), r1=37(y1), r2=288(x2), r3=198(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=266(x), r6=50(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=368(x), r11=167(y), r12=48(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 175
LDI r1, 37
LDI r2, 288
LDI r3, 198
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 50
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 368
LDI r11, 167
LDI r12, 48
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
