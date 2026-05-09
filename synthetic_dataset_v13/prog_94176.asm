; DESCRIPTION: Composite: Draws a green line from (201, 202) to (490, 200) then Creates a yellow rectangular region at (291, 104) spanning 79 by 29 pixels.
; PLAN: r0=201(x1), r1=202(y1), r2=490(x2), r3=200(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=291(x), r6=104(y), r7=79(width), r8=29(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 201
LDI r1, 202
LDI r2, 490
LDI r3, 200
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 104
LDI r7, 79
LDI r8, 29
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
