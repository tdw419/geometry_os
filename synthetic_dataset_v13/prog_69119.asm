; DESCRIPTION: Renders a blue line between points (121, 83) and (511, 249).
; PLAN: r0=121(x1), r1=83(y1), r2=511(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 83
LDI r2, 511
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
