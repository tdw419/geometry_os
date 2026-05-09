; DESCRIPTION: Places a white line segment connecting (400, 61) to (425, 63).
; PLAN: r0=400(x1), r1=61(y1), r2=425(x2), r3=63(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 61
LDI r2, 425
LDI r3, 63
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
