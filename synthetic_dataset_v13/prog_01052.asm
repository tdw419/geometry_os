; DESCRIPTION: Composite: Draws a yellow line from (256, 255) to (339, 225) then Renders a black box of size 52x84 starting at (355, 149) then Sets a single red pixel at (251, 116).
; PLAN: r0=256(x1), r1=255(y1), r2=339(x2), r3=225(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=355(x), r6=149(y), r7=52(width), r8=84(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=251(x), r11=116(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 256
LDI r1, 255
LDI r2, 339
LDI r3, 225
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 149
LDI r7, 52
LDI r8, 84
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 251
LDI r11, 116
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
