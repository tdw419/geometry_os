; DESCRIPTION: Places a purple line segment connecting (108, 82) to (285, 23).
; PLAN: r0=108(x1), r1=82(y1), r2=285(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 82
LDI r2, 285
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
