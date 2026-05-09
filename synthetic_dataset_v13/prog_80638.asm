; DESCRIPTION: Composite: Creates a purple rectangular region at (59, 97) spanning 80 by 117 pixels then Places a orange line segment connecting (422, 17) to (64, 145).
; PLAN: r0=59(x), r1=97(y), r2=80(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x1), r6=17(y1), r7=64(x2), r8=145(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 59
LDI r1, 97
LDI r2, 80
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 17
LDI r7, 64
LDI r8, 145
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
