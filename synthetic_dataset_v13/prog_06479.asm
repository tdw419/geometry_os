; DESCRIPTION: Composite: Renders a yellow line between points (131, 16) and (451, 245) then Places a red 95x71 rectangle at position (147, 143) then Renders a purple disk with center (468, 139) and radius 14.
; PLAN: r0=131(x1), r1=16(y1), r2=451(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=147(x), r6=143(y), r7=95(width), r8=71(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=468(x), r11=139(y), r12=14(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 131
LDI r1, 16
LDI r2, 451
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 147
LDI r6, 143
LDI r7, 95
LDI r8, 71
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 468
LDI r11, 139
LDI r12, 14
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
