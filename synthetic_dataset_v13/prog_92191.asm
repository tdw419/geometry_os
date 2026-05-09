; DESCRIPTION: Composite: Draws a purple line from (65, 178) to (234, 192) then Sets a single white pixel at (258, 77) then Renders a cyan box of size 17x88 starting at (192, 131).
; PLAN: r0=65(x1), r1=178(y1), r2=234(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=258(x), r6=77(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=192(x), r11=131(y), r12=17(width), r13=88(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 65
LDI r1, 178
LDI r2, 234
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 77
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 192
LDI r11, 131
LDI r12, 17
LDI r13, 88
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
