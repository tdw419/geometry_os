; DESCRIPTION: Draws a orange line from (370, 220) to (422, 75).
; PLAN: r0=370(x1), r1=220(y1), r2=422(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 220
LDI r2, 422
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
