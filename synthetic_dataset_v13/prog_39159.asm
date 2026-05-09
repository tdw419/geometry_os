; DESCRIPTION: Composite: Renders a yellow line between points (210, 3) and (126, 112) then Sets a single blue pixel at (252, 118) then Creates a black rectangular region at (66, 165) spanning 76 by 32 pixels.
; PLAN: r0=210(x1), r1=3(y1), r2=126(x2), r3=112(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=252(x), r6=118(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=66(x), r11=165(y), r12=76(width), r13=32(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 3
LDI r2, 126
LDI r3, 112
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 118
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 66
LDI r11, 165
LDI r12, 76
LDI r13, 32
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
