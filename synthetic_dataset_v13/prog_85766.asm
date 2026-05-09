; DESCRIPTION: Composite: Creates a blue rectangular region at (34, 45) spanning 50 by 104 pixels then Places a white line segment connecting (249, 31) to (364, 185).
; PLAN: r0=34(x), r1=45(y), r2=50(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=249(x1), r6=31(y1), r7=364(x2), r8=185(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 34
LDI r1, 45
LDI r2, 50
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 31
LDI r7, 364
LDI r8, 185
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
