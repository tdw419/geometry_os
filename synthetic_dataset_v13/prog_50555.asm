; DESCRIPTION: Composite: Places a green line segment connecting (401, 174) to (510, 52) then Places a orange dot at position (508, 246) then Creates a yellow circular shape at (134, 109) with radius 56.
; PLAN: r0=401(x1), r1=174(y1), r2=510(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=508(x), r6=246(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=134(x), r11=109(y), r12=56(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 401
LDI r1, 174
LDI r2, 510
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 508
LDI r6, 246
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 134
LDI r11, 109
LDI r12, 56
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
