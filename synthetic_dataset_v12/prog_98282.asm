; DESCRIPTION: Draws a white line from (423, 17) to (431, 141).
; PLAN: r0=423(x1), r1=17(y1), r2=431(x2), r3=141(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 17
LDI r2, 431
LDI r3, 141
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
