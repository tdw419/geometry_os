; DESCRIPTION: Composite: Draws a purple line from (407, 238) to (294, 192) then Sets a single yellow pixel at (350, 121) then Renders a cyan disk with center (61, 198) and radius 43.
; PLAN: r0=407(x1), r1=238(y1), r2=294(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=350(x), r6=121(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=61(x), r11=198(y), r12=43(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 407
LDI r1, 238
LDI r2, 294
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 121
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 61
LDI r11, 198
LDI r12, 43
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
