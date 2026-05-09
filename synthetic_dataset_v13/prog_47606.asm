; DESCRIPTION: Places a white line segment connecting (389, 68) to (226, 127).
; PLAN: r0=389(x1), r1=68(y1), r2=226(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 68
LDI r2, 226
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
