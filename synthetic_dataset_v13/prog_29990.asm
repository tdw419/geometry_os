; DESCRIPTION: Composite: Draws a black line from (454, 30) to (390, 8) then Places a yellow dot at position (239, 247) then Renders a magenta disk with center (259, 89) and radius 80.
; PLAN: r0=454(x1), r1=30(y1), r2=390(x2), r3=8(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=239(x), r6=247(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=259(x), r11=89(y), r12=80(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 454
LDI r1, 30
LDI r2, 390
LDI r3, 8
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 247
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 259
LDI r11, 89
LDI r12, 80
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
