; DESCRIPTION: Composite: Places a blue circle of radius 65 at center (126, 139) then Sets a single green pixel at (38, 132) then Draws a yellow line from (264, 178) to (84, 80).
; PLAN: r0=126(x), r1=139(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=38(x), r6=132(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=264(x1), r11=178(y1), r12=84(x2), r13=80(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 126
LDI r1, 139
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 38
LDI r6, 132
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 264
LDI r11, 178
LDI r12, 84
LDI r13, 80
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
