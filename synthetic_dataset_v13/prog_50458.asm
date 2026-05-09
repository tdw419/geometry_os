; DESCRIPTION: Renders a white line between points (147, 31) and (259, 196).
; PLAN: r0=147(x1), r1=31(y1), r2=259(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 31
LDI r2, 259
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
