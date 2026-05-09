; DESCRIPTION: Places a red line segment connecting (288, 80) to (398, 49).
; PLAN: r0=288(x1), r1=80(y1), r2=398(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 80
LDI r2, 398
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
