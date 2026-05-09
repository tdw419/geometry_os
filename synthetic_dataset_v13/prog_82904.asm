; DESCRIPTION: Places a blue line segment connecting (328, 73) to (114, 85).
; PLAN: r0=328(x1), r1=73(y1), r2=114(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 73
LDI r2, 114
LDI r3, 85
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
