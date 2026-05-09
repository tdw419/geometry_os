; DESCRIPTION: Draws a white line from (112, 54) to (204, 44).
; PLAN: r0=112(x1), r1=54(y1), r2=204(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 54
LDI r2, 204
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
