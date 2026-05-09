; DESCRIPTION: Composite: Draws a magenta line from (86, 125) to (497, 40) then Sets a single blue pixel at (172, 231) then Places a purple circle of radius 65 at center (218, 146).
; PLAN: r0=86(x1), r1=125(y1), r2=497(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=172(x), r6=231(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=218(x), r11=146(y), r12=65(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 86
LDI r1, 125
LDI r2, 497
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 231
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 218
LDI r11, 146
LDI r12, 65
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
