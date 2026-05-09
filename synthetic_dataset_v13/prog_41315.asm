; DESCRIPTION: Composite: Renders a white line between points (351, 116) and (44, 199) then Draws a black rectangle at (1, 147) with width 99 and height 64.
; PLAN: r0=351(x1), r1=116(y1), r2=44(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=1(x), r6=147(y), r7=99(width), r8=64(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 351
LDI r1, 116
LDI r2, 44
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 147
LDI r7, 99
LDI r8, 64
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
