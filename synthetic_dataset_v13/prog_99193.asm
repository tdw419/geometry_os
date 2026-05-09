; DESCRIPTION: Places a white line segment connecting (369, 112) to (398, 186).
; PLAN: r0=369(x1), r1=112(y1), r2=398(x2), r3=186(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 112
LDI r2, 398
LDI r3, 186
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
