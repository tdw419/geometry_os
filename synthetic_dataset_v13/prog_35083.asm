; DESCRIPTION: Draws a white line from (58, 10) to (15, 185).
; PLAN: r0=58(x1), r1=10(y1), r2=15(x2), r3=185(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 10
LDI r2, 15
LDI r3, 185
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
