; DESCRIPTION: Composite: Sets a single black pixel at (56, 136) then Creates a yellow rectangular region at (249, 65) spanning 27 by 64 pixels then Places a black line segment connecting (394, 136) to (71, 119).
; PLAN: r0=56(x), r1=136(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=249(x), r6=65(y), r7=27(width), r8=64(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=394(x1), r11=136(y1), r12=71(x2), r13=119(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 56
LDI r1, 136
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 249
LDI r6, 65
LDI r7, 27
LDI r8, 64
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 394
LDI r11, 136
LDI r12, 71
LDI r13, 119
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
