; DESCRIPTION: Composite: Places a yellow dot at position (244, 5) then Places a cyan line segment connecting (316, 86) to (341, 131) then Places a green 106x30 rectangle at position (12, 147).
; PLAN: r0=244(x), r1=5(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=316(x1), r6=86(y1), r7=341(x2), r8=131(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=12(x), r11=147(y), r12=106(width), r13=30(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 244
LDI r1, 5
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 316
LDI r6, 86
LDI r7, 341
LDI r8, 131
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 12
LDI r11, 147
LDI r12, 106
LDI r13, 30
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
