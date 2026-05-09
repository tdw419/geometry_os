; DESCRIPTION: Composite: Creates a purple rectangular region at (26, 176) spanning 45 by 58 pixels then Places a white line segment connecting (14, 229) to (480, 54).
; PLAN: r0=26(x), r1=176(y), r2=45(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=14(x1), r6=229(y1), r7=480(x2), r8=54(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 26
LDI r1, 176
LDI r2, 45
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 229
LDI r7, 480
LDI r8, 54
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
