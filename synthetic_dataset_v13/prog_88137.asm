; DESCRIPTION: Composite: Renders a magenta line between points (430, 185) and (37, 206) then Sets a single magenta pixel at (511, 65) then Renders a purple box of size 12x100 starting at (76, 131).
; PLAN: r0=430(x1), r1=185(y1), r2=37(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=511(x), r6=65(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=76(x), r11=131(y), r12=12(width), r13=100(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 430
LDI r1, 185
LDI r2, 37
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 511
LDI r6, 65
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 76
LDI r11, 131
LDI r12, 12
LDI r13, 100
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
