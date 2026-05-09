; DESCRIPTION: Renders a orange line between points (203, 187) and (57, 218).
; PLAN: r0=203(x1), r1=187(y1), r2=57(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 187
LDI r2, 57
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
