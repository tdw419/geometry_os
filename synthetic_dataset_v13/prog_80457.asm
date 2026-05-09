; DESCRIPTION: Composite: Renders a purple line between points (286, 196) and (103, 192) then Sets a single purple pixel at (110, 65) then Creates a purple rectangular region at (115, 155) spanning 110 by 23 pixels.
; PLAN: r0=286(x1), r1=196(y1), r2=103(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=110(x), r6=65(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=115(x), r11=155(y), r12=110(width), r13=23(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 286
LDI r1, 196
LDI r2, 103
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 65
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 115
LDI r11, 155
LDI r12, 110
LDI r13, 23
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
