; DESCRIPTION: Places a black line segment connecting (454, 125) to (398, 162).
; PLAN: r0=454(x1), r1=125(y1), r2=398(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 125
LDI r2, 398
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
