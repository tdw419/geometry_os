; DESCRIPTION: Places a blue line segment connecting (80, 38) to (174, 40).
; PLAN: r0=80(x1), r1=38(y1), r2=174(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 38
LDI r2, 174
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
