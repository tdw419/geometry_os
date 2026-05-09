; DESCRIPTION: Composite: Draws a magenta line from (157, 193) to (124, 231) then Draws a black circle centered at (320, 142) with radius 24 then Sets a single white pixel at (491, 88).
; PLAN: r0=157(x1), r1=193(y1), r2=124(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=142(y), r7=24(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=491(x), r11=88(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 157
LDI r1, 193
LDI r2, 124
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 142
LDI r7, 24
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 491
LDI r11, 88
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
