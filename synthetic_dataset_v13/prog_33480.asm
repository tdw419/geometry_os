; DESCRIPTION: Composite: Renders a blue box of size 20x71 starting at (355, 88) then Sets a single yellow pixel at (178, 27) then Renders a magenta line between points (143, 85) and (388, 47).
; PLAN: r0=355(x), r1=88(y), r2=20(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=178(x), r6=27(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=143(x1), r11=85(y1), r12=388(x2), r13=47(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 88
LDI r2, 20
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 27
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 143
LDI r11, 85
LDI r12, 388
LDI r13, 47
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
