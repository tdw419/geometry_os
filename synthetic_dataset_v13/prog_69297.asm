; DESCRIPTION: Renders a black line between points (358, 108) and (238, 180).
; PLAN: r0=358(x1), r1=108(y1), r2=238(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 108
LDI r2, 238
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
