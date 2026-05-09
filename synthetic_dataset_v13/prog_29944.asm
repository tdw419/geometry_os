; DESCRIPTION: Places a white line segment connecting (433, 211) to (60, 244).
; PLAN: r0=433(x1), r1=211(y1), r2=60(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 211
LDI r2, 60
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
