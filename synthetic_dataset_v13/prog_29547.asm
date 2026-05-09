; DESCRIPTION: Draws a white line from (214, 251) to (133, 212).
; PLAN: r0=214(x1), r1=251(y1), r2=133(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 251
LDI r2, 133
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
