; DESCRIPTION: Places a blue line segment connecting (470, 13) to (398, 115).
; PLAN: r0=470(x1), r1=13(y1), r2=398(x2), r3=115(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 13
LDI r2, 398
LDI r3, 115
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
