; DESCRIPTION: Places a white line segment connecting (403, 165) to (508, 70).
; PLAN: r0=403(x1), r1=165(y1), r2=508(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 165
LDI r2, 508
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
