; DESCRIPTION: Composite: Places a orange dot at position (408, 48) then Creates a purple circular shape at (127, 151) with radius 78 then Renders a blue line between points (314, 121) and (11, 71).
; PLAN: r0=408(x), r1=48(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=127(x), r6=151(y), r7=78(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=314(x1), r11=121(y1), r12=11(x2), r13=71(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 408
LDI r1, 48
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 127
LDI r6, 151
LDI r7, 78
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 314
LDI r11, 121
LDI r12, 11
LDI r13, 71
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
