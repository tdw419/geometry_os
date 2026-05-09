; DESCRIPTION: Composite: Draws a orange circle centered at (392, 71) with radius 56 then Draws a yellow line from (320, 101) to (27, 198) then Sets a single blue pixel at (67, 197).
; PLAN: r0=392(x), r1=71(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=320(x1), r6=101(y1), r7=27(x2), r8=198(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=67(x), r11=197(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 392
LDI r1, 71
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 320
LDI r6, 101
LDI r7, 27
LDI r8, 198
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 67
LDI r11, 197
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
