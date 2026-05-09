; DESCRIPTION: Renders a orange line between points (440, 145) and (189, 40).
; PLAN: r0=440(x1), r1=145(y1), r2=189(x2), r3=40(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 145
LDI r2, 189
LDI r3, 40
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
