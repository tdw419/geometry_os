; DESCRIPTION: Places a white line segment connecting (87, 35) to (204, 45).
; PLAN: r0=87(x1), r1=35(y1), r2=204(x2), r3=45(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 35
LDI r2, 204
LDI r3, 45
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
