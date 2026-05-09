; DESCRIPTION: Composite: Places a orange line segment connecting (97, 135) to (213, 115) then Sets a single cyan pixel at (5, 103) then Places a purple circle of radius 75 at center (85, 104).
; PLAN: r0=97(x1), r1=135(y1), r2=213(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=5(x), r6=103(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=85(x), r11=104(y), r12=75(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 97
LDI r1, 135
LDI r2, 213
LDI r3, 115
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 5
LDI r6, 103
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 85
LDI r11, 104
LDI r12, 75
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
