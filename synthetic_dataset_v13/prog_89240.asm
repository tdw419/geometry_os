; DESCRIPTION: Composite: Sets a single red pixel at (441, 199) then Renders a yellow box of size 110x72 starting at (22, 126) then Places a orange line segment connecting (16, 18) to (417, 128).
; PLAN: r0=441(x), r1=199(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=22(x), r6=126(y), r7=110(width), r8=72(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=16(x1), r11=18(y1), r12=417(x2), r13=128(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 441
LDI r1, 199
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 22
LDI r6, 126
LDI r7, 110
LDI r8, 72
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 16
LDI r11, 18
LDI r12, 417
LDI r13, 128
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
