; DESCRIPTION: Composite: Renders a black line between points (349, 25) and (32, 240) then Places a orange dot at position (147, 5) then Draws a magenta circle centered at (233, 128) with radius 62.
; PLAN: r0=349(x1), r1=25(y1), r2=32(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=147(x), r6=5(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=233(x), r11=128(y), r12=62(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 349
LDI r1, 25
LDI r2, 32
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 147
LDI r6, 5
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 233
LDI r11, 128
LDI r12, 62
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
