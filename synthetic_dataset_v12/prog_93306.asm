; DESCRIPTION: Renders a orange line between points (382, 147) and (275, 75).
; PLAN: r0=382(x1), r1=147(y1), r2=275(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 147
LDI r2, 275
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
