; DESCRIPTION: Draws a white line from (381, 169) to (208, 114).
; PLAN: r0=381(x1), r1=169(y1), r2=208(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 169
LDI r2, 208
LDI r3, 114
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
