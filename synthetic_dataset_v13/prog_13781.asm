; DESCRIPTION: Places a white line segment connecting (204, 251) to (65, 10).
; PLAN: r0=204(x1), r1=251(y1), r2=65(x2), r3=10(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 251
LDI r2, 65
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
