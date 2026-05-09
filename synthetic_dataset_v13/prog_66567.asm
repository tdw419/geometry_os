; DESCRIPTION: Renders a orange line between points (152, 94) and (218, 201).
; PLAN: r0=152(x1), r1=94(y1), r2=218(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 94
LDI r2, 218
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
