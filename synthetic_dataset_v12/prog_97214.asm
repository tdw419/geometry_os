; DESCRIPTION: Draws a white line from (500, 23) to (454, 58).
; PLAN: r0=500(x1), r1=23(y1), r2=454(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 23
LDI r2, 454
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
