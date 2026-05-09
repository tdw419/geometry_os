; DESCRIPTION: Renders a orange line between points (209, 152) and (355, 201).
; PLAN: r0=209(x1), r1=152(y1), r2=355(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 152
LDI r2, 355
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
