; DESCRIPTION: Places a blue line segment connecting (398, 11) to (334, 210).
; PLAN: r0=398(x1), r1=11(y1), r2=334(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 11
LDI r2, 334
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
