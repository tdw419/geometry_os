; DESCRIPTION: Composite: Renders a magenta line between points (263, 43) and (438, 85) then Places a black 37x106 rectangle at position (106, 147).
; PLAN: r0=263(x1), r1=43(y1), r2=438(x2), r3=85(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=106(x), r6=147(y), r7=37(width), r8=106(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 263
LDI r1, 43
LDI r2, 438
LDI r3, 85
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 147
LDI r7, 37
LDI r8, 106
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
