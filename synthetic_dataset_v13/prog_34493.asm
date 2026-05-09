; DESCRIPTION: Places a white line segment connecting (106, 200) to (59, 142).
; PLAN: r0=106(x1), r1=200(y1), r2=59(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 200
LDI r2, 59
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
