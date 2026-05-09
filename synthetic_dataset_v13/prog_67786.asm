; DESCRIPTION: Composite: Renders a blue box of size 63x13 starting at (21, 135) then Renders a purple line between points (438, 229) and (430, 65) then Places a red dot at position (268, 227).
; PLAN: r0=21(x), r1=135(y), r2=63(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=438(x1), r6=229(y1), r7=430(x2), r8=65(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=268(x), r11=227(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 21
LDI r1, 135
LDI r2, 63
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 229
LDI r7, 430
LDI r8, 65
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 268
LDI r11, 227
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
