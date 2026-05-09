; DESCRIPTION: Composite: Creates a red rectangular region at (364, 104) spanning 18 by 119 pixels then Places a red line segment connecting (336, 229) to (382, 54).
; PLAN: r0=364(x), r1=104(y), r2=18(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=336(x1), r6=229(y1), r7=382(x2), r8=54(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 364
LDI r1, 104
LDI r2, 18
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 229
LDI r7, 382
LDI r8, 54
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
