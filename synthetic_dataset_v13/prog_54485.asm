; DESCRIPTION: Renders a orange line between points (140, 13) and (271, 155).
; PLAN: r0=140(x1), r1=13(y1), r2=271(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 13
LDI r2, 271
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
