; DESCRIPTION: Composite: Places a cyan line segment connecting (169, 212) to (239, 90) then Sets a single yellow pixel at (137, 198) then Renders a white disk with center (118, 188) and radius 61.
; PLAN: r0=169(x1), r1=212(y1), r2=239(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=137(x), r6=198(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=118(x), r11=188(y), r12=61(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 169
LDI r1, 212
LDI r2, 239
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 198
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 118
LDI r11, 188
LDI r12, 61
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
