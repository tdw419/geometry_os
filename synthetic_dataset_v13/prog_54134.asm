; DESCRIPTION: Composite: Places a purple circle of radius 29 at center (128, 168) then Places a white line segment connecting (266, 180) to (179, 70) then Sets a single orange pixel at (369, 178).
; PLAN: r0=128(x), r1=168(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=266(x1), r6=180(y1), r7=179(x2), r8=70(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=369(x), r11=178(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 128
LDI r1, 168
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 266
LDI r6, 180
LDI r7, 179
LDI r8, 70
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 369
LDI r11, 178
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
