; DESCRIPTION: Composite: Sets a single orange pixel at (270, 195) then Creates a blue circular shape at (282, 160) with radius 77 then Places a orange line segment connecting (207, 94) to (21, 212).
; PLAN: r0=270(x), r1=195(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=282(x), r6=160(y), r7=77(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=207(x1), r11=94(y1), r12=21(x2), r13=212(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 195
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 282
LDI r6, 160
LDI r7, 77
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 207
LDI r11, 94
LDI r12, 21
LDI r13, 212
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
