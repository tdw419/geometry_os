; DESCRIPTION: Composite: Sets a single cyan pixel at (329, 193) then Places a purple line segment connecting (489, 87) to (436, 243) then Draws a orange rectangle at (390, 84) with width 91 and height 73.
; PLAN: r0=329(x), r1=193(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=489(x1), r6=87(y1), r7=436(x2), r8=243(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=390(x), r11=84(y), r12=91(width), r13=73(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 193
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 489
LDI r6, 87
LDI r7, 436
LDI r8, 243
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 84
LDI r12, 91
LDI r13, 73
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
