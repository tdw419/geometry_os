; DESCRIPTION: Renders a purple line between points (308, 243) and (210, 51).
; PLAN: r0=308(x1), r1=243(y1), r2=210(x2), r3=51(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 243
LDI r2, 210
LDI r3, 51
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
