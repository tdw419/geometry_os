; DESCRIPTION: Composite: Places a black line segment connecting (504, 132) to (258, 77) then Sets a single yellow pixel at (448, 247) then Renders a yellow box of size 101x73 starting at (9, 111).
; PLAN: r0=504(x1), r1=132(y1), r2=258(x2), r3=77(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=448(x), r6=247(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=9(x), r11=111(y), r12=101(width), r13=73(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 504
LDI r1, 132
LDI r2, 258
LDI r3, 77
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 247
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 9
LDI r11, 111
LDI r12, 101
LDI r13, 73
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
