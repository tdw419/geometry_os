; DESCRIPTION: Composite: Renders a yellow box of size 21x79 starting at (88, 68) then Sets a single black pixel at (401, 123) then Renders a magenta line between points (417, 87) and (237, 25).
; PLAN: r0=88(x), r1=68(y), r2=21(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x), r6=123(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=417(x1), r11=87(y1), r12=237(x2), r13=25(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 88
LDI r1, 68
LDI r2, 21
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 123
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 417
LDI r11, 87
LDI r12, 237
LDI r13, 25
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
