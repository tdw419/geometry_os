; DESCRIPTION: Renders a orange line between points (457, 131) and (224, 51).
; PLAN: r0=457(x1), r1=131(y1), r2=224(x2), r3=51(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 131
LDI r2, 224
LDI r3, 51
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
