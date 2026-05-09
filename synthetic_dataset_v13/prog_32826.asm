; DESCRIPTION: Renders a orange line between points (293, 80) and (220, 7).
; PLAN: r0=293(x1), r1=80(y1), r2=220(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 80
LDI r2, 220
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
