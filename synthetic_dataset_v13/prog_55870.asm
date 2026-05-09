; DESCRIPTION: Composite: Places a red dot at position (476, 88) then Creates a cyan circular shape at (276, 70) with radius 51 then Renders a blue line between points (18, 63) and (88, 140).
; PLAN: r0=476(x), r1=88(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=276(x), r6=70(y), r7=51(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=18(x1), r11=63(y1), r12=88(x2), r13=140(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 476
LDI r1, 88
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 276
LDI r6, 70
LDI r7, 51
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 18
LDI r11, 63
LDI r12, 88
LDI r13, 140
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
