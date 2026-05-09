; DESCRIPTION: Draws a white line from (277, 155) to (112, 217).
; PLAN: r0=277(x1), r1=155(y1), r2=112(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 155
LDI r2, 112
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
