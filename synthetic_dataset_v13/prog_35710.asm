; DESCRIPTION: Renders a red line between points (223, 63) and (105, 110).
; PLAN: r0=223(x1), r1=63(y1), r2=105(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 63
LDI r2, 105
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
