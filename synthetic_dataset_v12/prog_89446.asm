; DESCRIPTION: Draws a white line from (185, 211) to (88, 144).
; PLAN: r0=185(x1), r1=211(y1), r2=88(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 211
LDI r2, 88
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
