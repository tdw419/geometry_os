; DESCRIPTION: Places a blue line segment connecting (420, 219) to (398, 40).
; PLAN: r0=420(x1), r1=219(y1), r2=398(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 219
LDI r2, 398
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
