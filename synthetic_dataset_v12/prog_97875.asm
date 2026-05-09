; DESCRIPTION: Places a white line segment connecting (83, 102) to (403, 180).
; PLAN: r0=83(x1), r1=102(y1), r2=403(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 102
LDI r2, 403
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
