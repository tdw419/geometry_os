; DESCRIPTION: Composite: Renders a yellow line between points (132, 116) and (429, 183) then Creates a cyan rectangular region at (351, 137) spanning 51 by 49 pixels.
; PLAN: r0=132(x1), r1=116(y1), r2=429(x2), r3=183(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=351(x), r6=137(y), r7=51(width), r8=49(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 132
LDI r1, 116
LDI r2, 429
LDI r3, 183
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 137
LDI r7, 51
LDI r8, 49
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
