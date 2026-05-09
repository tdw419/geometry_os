; DESCRIPTION: Draws a orange line from (400, 40) to (422, 15).
; PLAN: r0=400(x1), r1=40(y1), r2=422(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 40
LDI r2, 422
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
