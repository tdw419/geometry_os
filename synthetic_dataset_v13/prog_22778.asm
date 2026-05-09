; DESCRIPTION: Draws a red line from (185, 241) to (87, 227).
; PLAN: r0=185(x1), r1=241(y1), r2=87(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 241
LDI r2, 87
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
