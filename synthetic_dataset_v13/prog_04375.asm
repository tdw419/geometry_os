; DESCRIPTION: Composite: Places a black 20x80 rectangle at position (419, 50) then Places a red line segment connecting (58, 132) to (266, 130) then Sets a single white pixel at (78, 230).
; PLAN: r0=419(x), r1=50(y), r2=20(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=58(x1), r6=132(y1), r7=266(x2), r8=130(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=78(x), r11=230(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 419
LDI r1, 50
LDI r2, 20
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 132
LDI r7, 266
LDI r8, 130
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 78
LDI r11, 230
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
