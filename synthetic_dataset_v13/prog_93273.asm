; DESCRIPTION: Composite: Sets a single red pixel at (472, 89) then Places a orange circle of radius 80 at center (110, 91) then Draws a purple line from (219, 228) to (428, 19).
; PLAN: r0=472(x), r1=89(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=110(x), r6=91(y), r7=80(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=219(x1), r11=228(y1), r12=428(x2), r13=19(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 472
LDI r1, 89
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 110
LDI r6, 91
LDI r7, 80
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 219
LDI r11, 228
LDI r12, 428
LDI r13, 19
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
