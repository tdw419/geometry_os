; DESCRIPTION: Renders a blue line between points (121, 167) and (426, 222).
; PLAN: r0=121(x1), r1=167(y1), r2=426(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 167
LDI r2, 426
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
