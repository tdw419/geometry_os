; DESCRIPTION: Places a yellow line segment connecting (360, 134) to (363, 33).
; PLAN: r0=360(x1), r1=134(y1), r2=363(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 134
LDI r2, 363
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
