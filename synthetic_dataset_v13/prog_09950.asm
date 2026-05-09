; DESCRIPTION: Composite: Places a blue dot at position (152, 216) then Places a orange 26x92 rectangle at position (170, 145) then Renders a yellow line between points (112, 107) and (408, 185).
; PLAN: r0=152(x), r1=216(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=170(x), r6=145(y), r7=26(width), r8=92(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=112(x1), r11=107(y1), r12=408(x2), r13=185(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 152
LDI r1, 216
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 170
LDI r6, 145
LDI r7, 26
LDI r8, 92
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 112
LDI r11, 107
LDI r12, 408
LDI r13, 185
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
