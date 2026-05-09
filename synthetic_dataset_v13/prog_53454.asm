; DESCRIPTION: Composite: Draws a magenta line from (339, 104) to (133, 238) then Creates a black rectangular region at (357, 58) spanning 78 by 20 pixels.
; PLAN: r0=339(x1), r1=104(y1), r2=133(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=357(x), r6=58(y), r7=78(width), r8=20(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 339
LDI r1, 104
LDI r2, 133
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 58
LDI r7, 78
LDI r8, 20
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
