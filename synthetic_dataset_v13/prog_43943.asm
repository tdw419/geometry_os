; DESCRIPTION: Composite: Draws a cyan line from (57, 25) to (478, 222) then Sets a single red pixel at (158, 249) then Creates a yellow circular shape at (127, 183) with radius 67.
; PLAN: r0=57(x1), r1=25(y1), r2=478(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=158(x), r6=249(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=127(x), r11=183(y), r12=67(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 57
LDI r1, 25
LDI r2, 478
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 249
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 127
LDI r11, 183
LDI r12, 67
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
