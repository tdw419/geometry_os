; DESCRIPTION: Renders a blue line between points (361, 184) and (458, 206).
; PLAN: r0=361(x1), r1=184(y1), r2=458(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 184
LDI r2, 458
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
