; DESCRIPTION: Composite: Places a yellow 112x89 rectangle at position (399, 156) then Places a blue line segment connecting (122, 90) to (58, 160).
; PLAN: r0=399(x), r1=156(y), r2=112(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=122(x1), r6=90(y1), r7=58(x2), r8=160(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 399
LDI r1, 156
LDI r2, 112
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 90
LDI r7, 58
LDI r8, 160
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
