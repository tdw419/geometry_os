; DESCRIPTION: Composite: Places a yellow line segment connecting (87, 120) to (498, 32) then Renders a white box of size 15x118 starting at (269, 110) then Sets a single yellow pixel at (53, 233).
; PLAN: r0=87(x1), r1=120(y1), r2=498(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=269(x), r6=110(y), r7=15(width), r8=118(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=53(x), r11=233(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 87
LDI r1, 120
LDI r2, 498
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 110
LDI r7, 15
LDI r8, 118
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 53
LDI r11, 233
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
