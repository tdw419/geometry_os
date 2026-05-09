; DESCRIPTION: Draws a white line from (407, 169) to (69, 52).
; PLAN: r0=407(x1), r1=169(y1), r2=69(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 169
LDI r2, 69
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
