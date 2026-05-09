; DESCRIPTION: Draws a white line from (313, 192) to (204, 185).
; PLAN: r0=313(x1), r1=192(y1), r2=204(x2), r3=185(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 192
LDI r2, 204
LDI r3, 185
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
