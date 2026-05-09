; DESCRIPTION: Composite: Creates a black rectangular region at (73, 153) spanning 38 by 10 pixels then Places a purple line segment connecting (83, 14) to (248, 253) then Places a blue dot at position (172, 160).
; PLAN: r0=73(x), r1=153(y), r2=38(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=83(x1), r6=14(y1), r7=248(x2), r8=253(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=172(x), r11=160(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 73
LDI r1, 153
LDI r2, 38
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 14
LDI r7, 248
LDI r8, 253
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 160
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
