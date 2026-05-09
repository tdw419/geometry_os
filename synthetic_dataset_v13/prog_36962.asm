; DESCRIPTION: Composite: Places a purple 94x17 rectangle at position (36, 95) then Places a cyan line segment connecting (369, 3) to (103, 182) then Places a orange dot at position (459, 38).
; PLAN: r0=36(x), r1=95(y), r2=94(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=369(x1), r6=3(y1), r7=103(x2), r8=182(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=459(x), r11=38(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 36
LDI r1, 95
LDI r2, 94
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 3
LDI r7, 103
LDI r8, 182
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 459
LDI r11, 38
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
