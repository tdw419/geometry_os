; DESCRIPTION: Places a black line segment connecting (59, 155) to (470, 168).
; PLAN: r0=59(x1), r1=155(y1), r2=470(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 155
LDI r2, 470
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
