; DESCRIPTION: Draws a orange line from (400, 57) to (281, 160).
; PLAN: r0=400(x1), r1=57(y1), r2=281(x2), r3=160(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 57
LDI r2, 281
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
