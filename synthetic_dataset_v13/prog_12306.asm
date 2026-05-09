; DESCRIPTION: Draws a white line from (143, 12) to (283, 155).
; PLAN: r0=143(x1), r1=12(y1), r2=283(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 12
LDI r2, 283
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
