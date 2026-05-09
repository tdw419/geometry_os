; DESCRIPTION: Composite: Places a purple circle of radius 41 at center (285, 170) then Places a yellow 95x37 rectangle at position (26, 206) then Places a black line segment connecting (363, 82) to (52, 142).
; PLAN: r0=285(x), r1=170(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=26(x), r6=206(y), r7=95(width), r8=37(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=363(x1), r11=82(y1), r12=52(x2), r13=142(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 285
LDI r1, 170
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 26
LDI r6, 206
LDI r7, 95
LDI r8, 37
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 363
LDI r11, 82
LDI r12, 52
LDI r13, 142
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
