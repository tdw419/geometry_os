; DESCRIPTION: Renders a blue line between points (213, 121) and (3, 142).
; PLAN: r0=213(x1), r1=121(y1), r2=3(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 121
LDI r2, 3
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
