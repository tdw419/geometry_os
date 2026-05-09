; DESCRIPTION: Draws a black line from (107, 201) to (109, 218).
; PLAN: r0=107(x1), r1=201(y1), r2=109(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 201
LDI r2, 109
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
