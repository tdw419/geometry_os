; DESCRIPTION: Composite: Draws a purple line from (431, 23) to (335, 9) then Creates a white rectangular region at (277, 30) spanning 104 by 66 pixels.
; PLAN: r0=431(x1), r1=23(y1), r2=335(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=277(x), r6=30(y), r7=104(width), r8=66(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 431
LDI r1, 23
LDI r2, 335
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 30
LDI r7, 104
LDI r8, 66
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
