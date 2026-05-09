; DESCRIPTION: Composite: Renders a purple line between points (12, 235) and (72, 181) then Places a cyan dot at position (431, 147) then Renders a magenta box of size 119x20 starting at (8, 116).
; PLAN: r0=12(x1), r1=235(y1), r2=72(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=431(x), r6=147(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=8(x), r11=116(y), r12=119(width), r13=20(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 12
LDI r1, 235
LDI r2, 72
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 147
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 8
LDI r11, 116
LDI r12, 119
LDI r13, 20
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
