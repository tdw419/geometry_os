; DESCRIPTION: Draws a black line from (217, 100) to (283, 145).
; PLAN: r0=217(x1), r1=100(y1), r2=283(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 100
LDI r2, 283
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
