; DESCRIPTION: Places a red line segment connecting (361, 207) to (207, 110).
; PLAN: r0=361(x1), r1=207(y1), r2=207(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 207
LDI r2, 207
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
