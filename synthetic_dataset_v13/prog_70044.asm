; DESCRIPTION: Composite: Places a orange dot at position (270, 194) then Renders a purple box of size 17x80 starting at (147, 175) then Places a black line segment connecting (295, 136) to (373, 194).
; PLAN: r0=270(x), r1=194(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=147(x), r6=175(y), r7=17(width), r8=80(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=295(x1), r11=136(y1), r12=373(x2), r13=194(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 194
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 147
LDI r6, 175
LDI r7, 17
LDI r8, 80
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 295
LDI r11, 136
LDI r12, 373
LDI r13, 194
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
