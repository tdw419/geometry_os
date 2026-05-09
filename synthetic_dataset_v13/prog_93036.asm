; DESCRIPTION: Draws a green line from (201, 133) to (260, 214).
; PLAN: r0=201(x1), r1=133(y1), r2=260(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 133
LDI r2, 260
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
