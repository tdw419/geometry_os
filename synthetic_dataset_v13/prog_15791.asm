; DESCRIPTION: Composite: Places a magenta line segment connecting (293, 38) to (288, 90) then Creates a magenta rectangular region at (176, 27) spanning 13 by 85 pixels then Sets a single yellow pixel at (506, 15).
; PLAN: r0=293(x1), r1=38(y1), r2=288(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=176(x), r6=27(y), r7=13(width), r8=85(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=506(x), r11=15(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 293
LDI r1, 38
LDI r2, 288
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 27
LDI r7, 13
LDI r8, 85
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 506
LDI r11, 15
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
