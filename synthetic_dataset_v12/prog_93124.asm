; DESCRIPTION: Composite: Places a orange circle of radius 67 at center (422, 158) then Draws a purple line from (193, 124) to (196, 251).
; PLAN: r0=422(x), r1=158(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=193(x1), r6=124(y1), r7=196(x2), r8=251(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 422
LDI r1, 158
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 193
LDI r6, 124
LDI r7, 196
LDI r8, 251
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
