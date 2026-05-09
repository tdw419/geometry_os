; DESCRIPTION: Composite: Places a magenta circle of radius 48 at center (227, 108) then Places a purple dot at position (307, 248) then Draws a black line from (4, 25) to (395, 245).
; PLAN: r0=227(x), r1=108(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x), r6=248(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=4(x1), r11=25(y1), r12=395(x2), r13=245(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 227
LDI r1, 108
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 248
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 4
LDI r11, 25
LDI r12, 395
LDI r13, 245
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
