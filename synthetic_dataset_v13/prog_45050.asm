; DESCRIPTION: Places a white line segment connecting (418, 47) to (293, 54).
; PLAN: r0=418(x1), r1=47(y1), r2=293(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 47
LDI r2, 293
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
