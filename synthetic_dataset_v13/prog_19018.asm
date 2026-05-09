; DESCRIPTION: Draws a white line from (102, 110) to (141, 121).
; PLAN: r0=102(x1), r1=110(y1), r2=141(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 110
LDI r2, 141
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
