; DESCRIPTION: Composite: Draws a orange line from (90, 249) to (319, 194) then Creates a magenta circular shape at (69, 169) with radius 32 then Sets a single cyan pixel at (430, 176).
; PLAN: r0=90(x1), r1=249(y1), r2=319(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=69(x), r6=169(y), r7=32(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=430(x), r11=176(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 90
LDI r1, 249
LDI r2, 319
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 169
LDI r7, 32
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 430
LDI r11, 176
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
