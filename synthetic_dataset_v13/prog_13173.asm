; DESCRIPTION: Renders a black line between points (358, 212) and (135, 180).
; PLAN: r0=358(x1), r1=212(y1), r2=135(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 212
LDI r2, 135
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
