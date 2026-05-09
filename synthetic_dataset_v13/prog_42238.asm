; DESCRIPTION: Draws a white line from (137, 100) to (466, 186).
; PLAN: r0=137(x1), r1=100(y1), r2=466(x2), r3=186(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 100
LDI r2, 466
LDI r3, 186
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
