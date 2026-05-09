; DESCRIPTION: Composite: Places a black line segment connecting (341, 72) to (459, 254) then Places a purple 53x37 rectangle at position (220, 185) then Sets a single cyan pixel at (80, 106).
; PLAN: r0=341(x1), r1=72(y1), r2=459(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=220(x), r6=185(y), r7=53(width), r8=37(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=80(x), r11=106(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 341
LDI r1, 72
LDI r2, 459
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 185
LDI r7, 53
LDI r8, 37
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 80
LDI r11, 106
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
