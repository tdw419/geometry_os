; DESCRIPTION: Draws a white line from (135, 247) to (232, 129).
; PLAN: r0=135(x1), r1=247(y1), r2=232(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 247
LDI r2, 232
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
