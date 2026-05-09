; DESCRIPTION: Places a white line segment connecting (200, 24) to (211, 29).
; PLAN: r0=200(x1), r1=24(y1), r2=211(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 24
LDI r2, 211
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
