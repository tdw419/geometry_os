; DESCRIPTION: Composite: Renders a orange line between points (218, 87) and (308, 219) then Creates a black rectangular region at (412, 86) spanning 65 by 33 pixels then Sets a single yellow pixel at (333, 103).
; PLAN: r0=218(x1), r1=87(y1), r2=308(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=412(x), r6=86(y), r7=65(width), r8=33(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=333(x), r11=103(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 218
LDI r1, 87
LDI r2, 308
LDI r3, 219
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 86
LDI r7, 65
LDI r8, 33
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 333
LDI r11, 103
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
