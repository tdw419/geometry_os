; DESCRIPTION: Composite: Creates a black rectangular region at (282, 31) spanning 75 by 91 pixels then Places a yellow line segment connecting (259, 89) to (67, 24).
; PLAN: r0=282(x), r1=31(y), r2=75(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=259(x1), r6=89(y1), r7=67(x2), r8=24(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 282
LDI r1, 31
LDI r2, 75
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 89
LDI r7, 67
LDI r8, 24
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
