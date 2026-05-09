; DESCRIPTION: Places a white line segment connecting (361, 22) to (293, 55).
; PLAN: r0=361(x1), r1=22(y1), r2=293(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 22
LDI r2, 293
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
