; DESCRIPTION: Renders a white line between points (99, 188) and (351, 31).
; PLAN: r0=99(x1), r1=188(y1), r2=351(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 188
LDI r2, 351
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
