; DESCRIPTION: Draws a white line from (413, 169) to (196, 245).
; PLAN: r0=413(x1), r1=169(y1), r2=196(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 169
LDI r2, 196
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
