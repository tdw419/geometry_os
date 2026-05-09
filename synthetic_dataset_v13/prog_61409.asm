; DESCRIPTION: Renders a black line between points (223, 198) and (301, 180).
; PLAN: r0=223(x1), r1=198(y1), r2=301(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 198
LDI r2, 301
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
