; DESCRIPTION: Renders a white line between points (223, 52) and (259, 7).
; PLAN: r0=223(x1), r1=52(y1), r2=259(x2), r3=7(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 52
LDI r2, 259
LDI r3, 7
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
