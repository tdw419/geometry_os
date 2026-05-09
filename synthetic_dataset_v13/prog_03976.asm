; DESCRIPTION: Places a white line segment connecting (489, 112) to (1, 59).
; PLAN: r0=489(x1), r1=112(y1), r2=1(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 112
LDI r2, 1
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
