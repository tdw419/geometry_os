; DESCRIPTION: Places a white line segment connecting (478, 73) to (403, 3).
; PLAN: r0=478(x1), r1=73(y1), r2=403(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 73
LDI r2, 403
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
