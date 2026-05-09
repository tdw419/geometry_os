; DESCRIPTION: Places a white line segment connecting (47, 34) to (161, 226).
; PLAN: r0=47(x1), r1=34(y1), r2=161(x2), r3=226(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 34
LDI r2, 161
LDI r3, 226
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
