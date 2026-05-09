; DESCRIPTION: Composite: Draws a blue line from (108, 64) to (373, 139) then Draws a black rectangle at (161, 156) with width 57 and height 88 then Sets a single orange pixel at (441, 248).
; PLAN: r0=108(x1), r1=64(y1), r2=373(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=156(y), r7=57(width), r8=88(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=441(x), r11=248(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 108
LDI r1, 64
LDI r2, 373
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 156
LDI r7, 57
LDI r8, 88
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 441
LDI r11, 248
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
