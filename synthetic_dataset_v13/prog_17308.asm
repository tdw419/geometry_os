; DESCRIPTION: Composite: Places a magenta line segment connecting (260, 232) to (147, 253) then Places a green dot at position (286, 72) then Places a purple 57x110 rectangle at position (345, 116).
; PLAN: r0=260(x1), r1=232(y1), r2=147(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=286(x), r6=72(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=345(x), r11=116(y), r12=57(width), r13=110(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 260
LDI r1, 232
LDI r2, 147
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 72
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 345
LDI r11, 116
LDI r12, 57
LDI r13, 110
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
