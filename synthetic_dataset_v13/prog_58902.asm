; DESCRIPTION: Renders a blue line between points (474, 178) and (121, 134).
; PLAN: r0=474(x1), r1=178(y1), r2=121(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 178
LDI r2, 121
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
