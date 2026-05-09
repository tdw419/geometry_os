; DESCRIPTION: Composite: Places a magenta line segment connecting (484, 87) to (275, 224) then Renders a magenta box of size 39x81 starting at (205, 110) then Sets a single yellow pixel at (153, 197).
; PLAN: r0=484(x1), r1=87(y1), r2=275(x2), r3=224(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=110(y), r7=39(width), r8=81(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=153(x), r11=197(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 484
LDI r1, 87
LDI r2, 275
LDI r3, 224
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 110
LDI r7, 39
LDI r8, 81
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 153
LDI r11, 197
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
