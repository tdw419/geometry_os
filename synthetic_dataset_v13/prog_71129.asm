; DESCRIPTION: Composite: Places a orange dot at position (317, 102) then Creates a green circular shape at (441, 179) with radius 40 then Draws a purple line from (135, 18) to (37, 146).
; PLAN: r0=317(x), r1=102(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=441(x), r6=179(y), r7=40(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=135(x1), r11=18(y1), r12=37(x2), r13=146(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 317
LDI r1, 102
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 441
LDI r6, 179
LDI r7, 40
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 135
LDI r11, 18
LDI r12, 37
LDI r13, 146
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
