; DESCRIPTION: Composite: Places a purple line segment connecting (438, 169) to (259, 248) then Creates a yellow rectangular region at (312, 64) spanning 53 by 58 pixels then Places a cyan dot at position (428, 80).
; PLAN: r0=438(x1), r1=169(y1), r2=259(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=64(y), r7=53(width), r8=58(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=428(x), r11=80(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 438
LDI r1, 169
LDI r2, 259
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 64
LDI r7, 53
LDI r8, 58
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 428
LDI r11, 80
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
