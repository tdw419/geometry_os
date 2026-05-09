; DESCRIPTION: Draws a white line from (77, 185) to (70, 165).
; PLAN: r0=77(x1), r1=185(y1), r2=70(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 185
LDI r2, 70
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
