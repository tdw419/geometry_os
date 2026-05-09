; DESCRIPTION: Renders a orange line between points (500, 194) and (57, 107).
; PLAN: r0=500(x1), r1=194(y1), r2=57(x2), r3=107(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 194
LDI r2, 57
LDI r3, 107
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
