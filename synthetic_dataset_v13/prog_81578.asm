; DESCRIPTION: Places a white line segment connecting (236, 216) to (153, 79).
; PLAN: r0=236(x1), r1=216(y1), r2=153(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 216
LDI r2, 153
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
