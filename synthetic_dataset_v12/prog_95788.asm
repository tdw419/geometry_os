; DESCRIPTION: Places a white line segment connecting (120, 207) to (448, 59).
; PLAN: r0=120(x1), r1=207(y1), r2=448(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 207
LDI r2, 448
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
