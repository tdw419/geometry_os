; DESCRIPTION: Composite: Creates a yellow circular shape at (384, 132) with radius 23 then Sets a single white pixel at (263, 4) then Draws a magenta line from (94, 149) to (489, 185).
; PLAN: r0=384(x), r1=132(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=263(x), r6=4(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=94(x1), r11=149(y1), r12=489(x2), r13=185(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 132
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 263
LDI r6, 4
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 94
LDI r11, 149
LDI r12, 489
LDI r13, 185
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
