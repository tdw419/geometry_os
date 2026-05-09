; DESCRIPTION: Places a orange line segment connecting (395, 93) to (506, 17).
; PLAN: r0=395(x1), r1=93(y1), r2=506(x2), r3=17(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 93
LDI r2, 506
LDI r3, 17
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
