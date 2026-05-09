; DESCRIPTION: Composite: Draws a red line from (484, 39) to (205, 23) then Places a yellow dot at position (278, 81) then Places a magenta circle of radius 46 at center (179, 160).
; PLAN: r0=484(x1), r1=39(y1), r2=205(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=278(x), r6=81(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=179(x), r11=160(y), r12=46(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 484
LDI r1, 39
LDI r2, 205
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 81
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 179
LDI r11, 160
LDI r12, 46
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
