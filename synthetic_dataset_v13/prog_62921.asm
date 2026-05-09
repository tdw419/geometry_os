; DESCRIPTION: Renders a blue line between points (299, 121) and (296, 64).
; PLAN: r0=299(x1), r1=121(y1), r2=296(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 121
LDI r2, 296
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
