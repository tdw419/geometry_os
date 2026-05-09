; DESCRIPTION: Composite: Sets a single yellow pixel at (316, 126) then Draws a black line from (397, 68) to (13, 199) then Places a yellow circle of radius 22 at center (402, 81).
; PLAN: r0=316(x), r1=126(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=397(x1), r6=68(y1), r7=13(x2), r8=199(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=402(x), r11=81(y), r12=22(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 316
LDI r1, 126
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 397
LDI r6, 68
LDI r7, 13
LDI r8, 199
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 402
LDI r11, 81
LDI r12, 22
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
