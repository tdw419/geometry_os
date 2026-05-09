; DESCRIPTION: Composite: Renders a green line between points (230, 188) and (137, 10) then Renders a red box of size 112x66 starting at (251, 86) then Sets a single blue pixel at (7, 152).
; PLAN: r0=230(x1), r1=188(y1), r2=137(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=251(x), r6=86(y), r7=112(width), r8=66(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=7(x), r11=152(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 230
LDI r1, 188
LDI r2, 137
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 86
LDI r7, 112
LDI r8, 66
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 7
LDI r11, 152
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
