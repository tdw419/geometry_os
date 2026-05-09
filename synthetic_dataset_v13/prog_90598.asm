; DESCRIPTION: Renders a blue line between points (82, 62) and (249, 51).
; PLAN: r0=82(x1), r1=62(y1), r2=249(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 62
LDI r2, 249
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
