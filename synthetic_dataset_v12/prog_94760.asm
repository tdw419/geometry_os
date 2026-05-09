; DESCRIPTION: Composite: Creates a green rectangular region at (331, 80) spanning 87 by 116 pixels then Sets a single black pixel at (267, 12) then Renders a red line between points (136, 237) and (60, 137).
; PLAN: r0=331(x), r1=80(y), r2=87(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=267(x), r6=12(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=136(x1), r11=237(y1), r12=60(x2), r13=137(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 331
LDI r1, 80
LDI r2, 87
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 12
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 136
LDI r11, 237
LDI r12, 60
LDI r13, 137
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
