; DESCRIPTION: Places a white line segment connecting (108, 216) to (349, 70).
; PLAN: r0=108(x1), r1=216(y1), r2=349(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 216
LDI r2, 349
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
