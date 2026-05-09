; DESCRIPTION: Places a green line segment connecting (33, 186) to (266, 85).
; PLAN: r0=33(x1), r1=186(y1), r2=266(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 186
LDI r2, 266
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
