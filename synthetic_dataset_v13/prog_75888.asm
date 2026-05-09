; DESCRIPTION: Composite: Places a magenta dot at position (382, 133) then Places a red line segment connecting (211, 184) to (430, 17) then Creates a yellow rectangular region at (257, 115) spanning 14 by 54 pixels.
; PLAN: r0=382(x), r1=133(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=211(x1), r6=184(y1), r7=430(x2), r8=17(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=257(x), r11=115(y), r12=14(width), r13=54(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 382
LDI r1, 133
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 211
LDI r6, 184
LDI r7, 430
LDI r8, 17
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 257
LDI r11, 115
LDI r12, 14
LDI r13, 54
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
