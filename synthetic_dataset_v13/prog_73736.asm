; DESCRIPTION: Draws a white line from (321, 22) to (332, 247).
; PLAN: r0=321(x1), r1=22(y1), r2=332(x2), r3=247(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 22
LDI r2, 332
LDI r3, 247
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
