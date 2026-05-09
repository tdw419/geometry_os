; DESCRIPTION: Renders a white line between points (259, 189) and (481, 77).
; PLAN: r0=259(x1), r1=189(y1), r2=481(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 189
LDI r2, 481
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
