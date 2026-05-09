; DESCRIPTION: Renders a blue line between points (20, 229) and (125, 45).
; PLAN: r0=20(x1), r1=229(y1), r2=125(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 229
LDI r2, 125
LDI r3, 45
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
