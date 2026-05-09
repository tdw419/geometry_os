; DESCRIPTION: Places a white line segment connecting (296, 61) to (55, 142).
; PLAN: r0=296(x1), r1=61(y1), r2=55(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 61
LDI r2, 55
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
