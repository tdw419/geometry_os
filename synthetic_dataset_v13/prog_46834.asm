; DESCRIPTION: Renders a blue line between points (206, 94) and (51, 59).
; PLAN: r0=206(x1), r1=94(y1), r2=51(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 94
LDI r2, 51
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
