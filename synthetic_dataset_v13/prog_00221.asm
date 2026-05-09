; DESCRIPTION: Renders a white line between points (283, 74) and (451, 191).
; PLAN: r0=283(x1), r1=74(y1), r2=451(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 74
LDI r2, 451
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
