; DESCRIPTION: Composite: Draws a purple line from (354, 128) to (394, 21) then Draws a black circle centered at (466, 150) with radius 43 then Sets a single blue pixel at (0, 4).
; PLAN: r0=354(x1), r1=128(y1), r2=394(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=466(x), r6=150(y), r7=43(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=0(x), r11=4(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 354
LDI r1, 128
LDI r2, 394
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 150
LDI r7, 43
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 0
LDI r11, 4
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
