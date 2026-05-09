; DESCRIPTION: Places a blue line segment connecting (237, 171) to (495, 25).
; PLAN: r0=237(x1), r1=171(y1), r2=495(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 171
LDI r2, 495
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
