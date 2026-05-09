; DESCRIPTION: Composite: Renders a yellow box of size 109x42 starting at (257, 11) then Renders a black line between points (236, 95) and (150, 179) then Sets a single blue pixel at (342, 169).
; PLAN: r0=257(x), r1=11(y), r2=109(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x1), r6=95(y1), r7=150(x2), r8=179(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=342(x), r11=169(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 257
LDI r1, 11
LDI r2, 109
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 95
LDI r7, 150
LDI r8, 179
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 342
LDI r11, 169
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
