; DESCRIPTION: Places a green line segment connecting (360, 145) to (46, 218).
; PLAN: r0=360(x1), r1=145(y1), r2=46(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 145
LDI r2, 46
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
