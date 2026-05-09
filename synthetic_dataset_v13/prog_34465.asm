; DESCRIPTION: Places a black line segment connecting (389, 210) to (313, 79).
; PLAN: r0=389(x1), r1=210(y1), r2=313(x2), r3=79(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 210
LDI r2, 313
LDI r3, 79
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
