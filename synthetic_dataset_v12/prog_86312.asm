; DESCRIPTION: Composite: Places a yellow line segment connecting (135, 123) to (71, 110) then Renders a black box of size 29x79 starting at (480, 102) then Sets a single orange pixel at (196, 50).
; PLAN: r0=135(x1), r1=123(y1), r2=71(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=480(x), r6=102(y), r7=29(width), r8=79(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=196(x), r11=50(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 135
LDI r1, 123
LDI r2, 71
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 480
LDI r6, 102
LDI r7, 29
LDI r8, 79
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 196
LDI r11, 50
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
