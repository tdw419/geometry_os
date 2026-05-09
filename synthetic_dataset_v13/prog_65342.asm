; DESCRIPTION: Draws a red line from (454, 140) to (283, 89).
; PLAN: r0=454(x1), r1=140(y1), r2=283(x2), r3=89(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 140
LDI r2, 283
LDI r3, 89
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
