; DESCRIPTION: Composite: Draws a green line from (448, 0) to (82, 87) then Sets a single purple pixel at (476, 77) then Creates a yellow rectangular region at (414, 129) spanning 54 by 67 pixels.
; PLAN: r0=448(x1), r1=0(y1), r2=82(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=476(x), r6=77(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=414(x), r11=129(y), r12=54(width), r13=67(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 448
LDI r1, 0
LDI r2, 82
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 476
LDI r6, 77
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 414
LDI r11, 129
LDI r12, 54
LDI r13, 67
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
