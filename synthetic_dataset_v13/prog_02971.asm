; DESCRIPTION: Places a blue line segment connecting (297, 134) to (121, 253).
; PLAN: r0=297(x1), r1=134(y1), r2=121(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 134
LDI r2, 121
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
