; DESCRIPTION: Renders a purple line between points (472, 51) and (446, 209).
; PLAN: r0=472(x1), r1=51(y1), r2=446(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 51
LDI r2, 446
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
