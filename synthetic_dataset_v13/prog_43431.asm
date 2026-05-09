; DESCRIPTION: Composite: Places a purple 94x52 rectangle at position (400, 125) then Draws a orange line from (462, 78) to (222, 14).
; PLAN: r0=400(x), r1=125(y), r2=94(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=462(x1), r6=78(y1), r7=222(x2), r8=14(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 125
LDI r2, 94
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 78
LDI r7, 222
LDI r8, 14
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
