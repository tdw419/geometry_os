; DESCRIPTION: Places a black line segment connecting (161, 84) to (353, 177).
; PLAN: r0=161(x1), r1=84(y1), r2=353(x2), r3=177(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 84
LDI r2, 353
LDI r3, 177
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
