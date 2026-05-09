; DESCRIPTION: Composite: Renders a green line between points (236, 10) and (227, 207) then Sets a single magenta pixel at (150, 185) then Creates a purple rectangular region at (132, 24) spanning 48 by 51 pixels.
; PLAN: r0=236(x1), r1=10(y1), r2=227(x2), r3=207(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=150(x), r6=185(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=132(x), r11=24(y), r12=48(width), r13=51(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 236
LDI r1, 10
LDI r2, 227
LDI r3, 207
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 185
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 132
LDI r11, 24
LDI r12, 48
LDI r13, 51
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
