; DESCRIPTION: Renders a blue line between points (45, 179) and (435, 229).
; PLAN: r0=45(x1), r1=179(y1), r2=435(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 179
LDI r2, 435
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
