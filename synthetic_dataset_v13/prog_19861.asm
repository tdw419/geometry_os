; DESCRIPTION: Renders a blue line between points (361, 34) and (294, 133).
; PLAN: r0=361(x1), r1=34(y1), r2=294(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 34
LDI r2, 294
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
