; DESCRIPTION: Composite: Creates a blue rectangular region at (45, 175) spanning 17 by 26 pixels then Sets a single magenta pixel at (220, 143) then Places a white line segment connecting (402, 169) to (111, 165).
; PLAN: r0=45(x), r1=175(y), r2=17(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=220(x), r6=143(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=402(x1), r11=169(y1), r12=111(x2), r13=165(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 45
LDI r1, 175
LDI r2, 17
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 143
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 402
LDI r11, 169
LDI r12, 111
LDI r13, 165
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
