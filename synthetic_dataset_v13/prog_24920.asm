; DESCRIPTION: Places a white line segment connecting (266, 5) to (398, 31).
; PLAN: r0=266(x1), r1=5(y1), r2=398(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 5
LDI r2, 398
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
