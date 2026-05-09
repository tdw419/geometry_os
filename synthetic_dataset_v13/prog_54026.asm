; DESCRIPTION: Composite: Renders a purple line between points (284, 76) and (136, 152) then Sets a single green pixel at (455, 156) then Creates a purple rectangular region at (193, 119) spanning 115 by 116 pixels.
; PLAN: r0=284(x1), r1=76(y1), r2=136(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=455(x), r6=156(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=193(x), r11=119(y), r12=115(width), r13=116(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 76
LDI r2, 136
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 156
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 193
LDI r11, 119
LDI r12, 115
LDI r13, 116
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
