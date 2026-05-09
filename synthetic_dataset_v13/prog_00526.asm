; DESCRIPTION: Places a black line segment connecting (290, 233) to (359, 76).
; PLAN: r0=290(x1), r1=233(y1), r2=359(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 233
LDI r2, 359
LDI r3, 76
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
