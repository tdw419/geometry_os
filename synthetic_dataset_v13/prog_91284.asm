; DESCRIPTION: Draws a white line from (60, 110) to (248, 80).
; PLAN: r0=60(x1), r1=110(y1), r2=248(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 110
LDI r2, 248
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
