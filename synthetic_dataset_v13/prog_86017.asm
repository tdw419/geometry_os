; DESCRIPTION: Composite: Places a yellow 87x49 rectangle at position (145, 118) then Places a purple line segment connecting (434, 1) to (507, 228) then Sets a single white pixel at (157, 199).
; PLAN: r0=145(x), r1=118(y), r2=87(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=434(x1), r6=1(y1), r7=507(x2), r8=228(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=157(x), r11=199(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 145
LDI r1, 118
LDI r2, 87
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 1
LDI r7, 507
LDI r8, 228
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 157
LDI r11, 199
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
