; DESCRIPTION: Composite: Places a blue line segment connecting (65, 107) to (276, 29) then Places a orange 12x25 rectangle at position (336, 145) then Places a purple circle of radius 32 at center (248, 139).
; PLAN: r0=65(x1), r1=107(y1), r2=276(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=336(x), r6=145(y), r7=12(width), r8=25(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=248(x), r11=139(y), r12=32(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 65
LDI r1, 107
LDI r2, 276
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 145
LDI r7, 12
LDI r8, 25
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 248
LDI r11, 139
LDI r12, 32
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
