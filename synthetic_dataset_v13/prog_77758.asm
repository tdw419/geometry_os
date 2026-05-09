; DESCRIPTION: Composite: Sets a single yellow pixel at (195, 106) then Places a cyan line segment connecting (175, 112) to (314, 147) then Places a yellow 56x11 rectangle at position (61, 60).
; PLAN: r0=195(x), r1=106(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=175(x1), r6=112(y1), r7=314(x2), r8=147(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=61(x), r11=60(y), r12=56(width), r13=11(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 195
LDI r1, 106
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 175
LDI r6, 112
LDI r7, 314
LDI r8, 147
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 61
LDI r11, 60
LDI r12, 56
LDI r13, 11
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
