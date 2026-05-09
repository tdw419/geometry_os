; DESCRIPTION: Draws a white line from (80, 251) to (444, 92).
; PLAN: r0=80(x1), r1=251(y1), r2=444(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 251
LDI r2, 444
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
