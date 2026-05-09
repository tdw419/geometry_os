; DESCRIPTION: Draws a white line from (153, 107) to (110, 35).
; PLAN: r0=153(x1), r1=107(y1), r2=110(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 107
LDI r2, 110
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
