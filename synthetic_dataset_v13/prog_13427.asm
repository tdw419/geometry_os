; DESCRIPTION: Composite: Places a yellow line segment connecting (297, 1) to (476, 161) then Creates a blue rectangular region at (235, 172) spanning 42 by 72 pixels then Places a purple dot at position (273, 20).
; PLAN: r0=297(x1), r1=1(y1), r2=476(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=235(x), r6=172(y), r7=42(width), r8=72(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=273(x), r11=20(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 297
LDI r1, 1
LDI r2, 476
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 172
LDI r7, 42
LDI r8, 72
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 273
LDI r11, 20
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
