; DESCRIPTION: Renders a white line between points (226, 192) and (189, 3).
; PLAN: r0=226(x1), r1=192(y1), r2=189(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 192
LDI r2, 189
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
