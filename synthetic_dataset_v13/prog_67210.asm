; DESCRIPTION: Composite: Draws a yellow circle centered at (142, 198) with radius 39 then Renders a purple line between points (377, 224) and (170, 75) then Places a black dot at position (441, 87).
; PLAN: r0=142(x), r1=198(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x1), r6=224(y1), r7=170(x2), r8=75(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=441(x), r11=87(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 142
LDI r1, 198
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 224
LDI r7, 170
LDI r8, 75
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 441
LDI r11, 87
LDI r12, 0x000000
PSET r10, r11, r12
HALT
