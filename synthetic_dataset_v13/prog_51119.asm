; DESCRIPTION: Places a blue line segment connecting (29, 171) to (161, 171).
; PLAN: r0=29(x1), r1=171(y1), r2=161(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 171
LDI r2, 161
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
