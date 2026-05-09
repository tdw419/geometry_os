; DESCRIPTION: Composite: Places a yellow line segment connecting (147, 148) to (435, 24) then Places a green dot at position (107, 14) then Places a cyan circle of radius 70 at center (97, 148).
; PLAN: r0=147(x1), r1=148(y1), r2=435(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=107(x), r6=14(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=97(x), r11=148(y), r12=70(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 147
LDI r1, 148
LDI r2, 435
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 14
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 97
LDI r11, 148
LDI r12, 70
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
