; DESCRIPTION: Composite: Places a blue dot at position (226, 34) then Places a magenta line segment connecting (87, 213) to (306, 110) then Places a purple circle of radius 53 at center (379, 70).
; PLAN: r0=226(x), r1=34(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=87(x1), r6=213(y1), r7=306(x2), r8=110(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=379(x), r11=70(y), r12=53(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 226
LDI r1, 34
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 87
LDI r6, 213
LDI r7, 306
LDI r8, 110
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 379
LDI r11, 70
LDI r12, 53
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
