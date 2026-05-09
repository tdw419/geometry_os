; DESCRIPTION: Places a red line segment connecting (17, 105) to (470, 60).
; PLAN: r0=17(x1), r1=105(y1), r2=470(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 105
LDI r2, 470
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
