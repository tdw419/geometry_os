; DESCRIPTION: Composite: Creates a green rectangular region at (259, 61) spanning 109 by 51 pixels then Places a black dot at position (496, 26) then Renders a magenta line between points (278, 20) and (412, 24).
; PLAN: r0=259(x), r1=61(y), r2=109(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=496(x), r6=26(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=278(x1), r11=20(y1), r12=412(x2), r13=24(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 61
LDI r2, 109
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 496
LDI r6, 26
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 278
LDI r11, 20
LDI r12, 412
LDI r13, 24
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
