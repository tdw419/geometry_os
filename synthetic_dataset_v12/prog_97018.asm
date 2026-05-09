; DESCRIPTION: Places a white line segment connecting (385, 169) to (398, 177).
; PLAN: r0=385(x1), r1=169(y1), r2=398(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 169
LDI r2, 398
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
