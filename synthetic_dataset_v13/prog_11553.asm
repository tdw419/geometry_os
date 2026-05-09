; DESCRIPTION: Composite: Places a green circle of radius 51 at center (66, 186) then Renders a green box of size 119x80 starting at (222, 33) then Draws a green line from (325, 216) to (286, 226).
; PLAN: r0=66(x), r1=186(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=222(x), r6=33(y), r7=119(width), r8=80(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=325(x1), r11=216(y1), r12=286(x2), r13=226(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 66
LDI r1, 186
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 222
LDI r6, 33
LDI r7, 119
LDI r8, 80
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 325
LDI r11, 216
LDI r12, 286
LDI r13, 226
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
