; DESCRIPTION: Places a white line segment connecting (361, 206) to (85, 4).
; PLAN: r0=361(x1), r1=206(y1), r2=85(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 206
LDI r2, 85
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
