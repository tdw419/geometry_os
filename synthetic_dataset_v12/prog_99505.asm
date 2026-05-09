; DESCRIPTION: Places a orange line segment connecting (216, 138) to (349, 220).
; PLAN: r0=216(x1), r1=138(y1), r2=349(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 138
LDI r2, 349
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
