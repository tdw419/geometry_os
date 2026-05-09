; DESCRIPTION: Renders a purple line between points (145, 221) and (160, 7).
; PLAN: r0=145(x1), r1=221(y1), r2=160(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 221
LDI r2, 160
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
