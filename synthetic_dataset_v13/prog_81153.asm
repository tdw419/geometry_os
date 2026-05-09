; DESCRIPTION: Places a blue line segment connecting (210, 151) to (73, 137).
; PLAN: r0=210(x1), r1=151(y1), r2=73(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 151
LDI r2, 73
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
