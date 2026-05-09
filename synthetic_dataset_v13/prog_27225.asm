; DESCRIPTION: Renders a blue line between points (288, 179) and (446, 18).
; PLAN: r0=288(x1), r1=179(y1), r2=446(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 179
LDI r2, 446
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
