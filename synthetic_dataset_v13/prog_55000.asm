; DESCRIPTION: Renders a orange line between points (451, 64) and (400, 213).
; PLAN: r0=451(x1), r1=64(y1), r2=400(x2), r3=213(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 64
LDI r2, 400
LDI r3, 213
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
