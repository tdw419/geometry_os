; DESCRIPTION: Renders a orange line between points (426, 36) and (351, 221).
; PLAN: r0=426(x1), r1=36(y1), r2=351(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 36
LDI r2, 351
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
