; DESCRIPTION: Draws a red line from (451, 253) to (23, 51).
; PLAN: r0=451(x1), r1=253(y1), r2=23(x2), r3=51(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 253
LDI r2, 23
LDI r3, 51
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
