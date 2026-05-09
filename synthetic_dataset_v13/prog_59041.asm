; DESCRIPTION: Renders a orange line between points (77, 45) and (480, 155).
; PLAN: r0=77(x1), r1=45(y1), r2=480(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 45
LDI r2, 480
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
