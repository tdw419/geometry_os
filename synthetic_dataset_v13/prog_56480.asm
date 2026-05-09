; DESCRIPTION: Composite: Draws a blue rectangle at (400, 109) with width 80 and height 110 then Draws a white line from (306, 201) to (23, 104).
; PLAN: r0=400(x), r1=109(y), r2=80(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x1), r6=201(y1), r7=23(x2), r8=104(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 109
LDI r2, 80
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 201
LDI r7, 23
LDI r8, 104
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
