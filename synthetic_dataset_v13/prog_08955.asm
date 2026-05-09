; DESCRIPTION: Composite: Draws a blue line from (369, 214) to (354, 128) then Creates a red circular shape at (279, 217) with radius 12 then Places a black dot at position (84, 156).
; PLAN: r0=369(x1), r1=214(y1), r2=354(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=279(x), r6=217(y), r7=12(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=84(x), r11=156(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 369
LDI r1, 214
LDI r2, 354
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 217
LDI r7, 12
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 84
LDI r11, 156
LDI r12, 0x000000
PSET r10, r11, r12
HALT
