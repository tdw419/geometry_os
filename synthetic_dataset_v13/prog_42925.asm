; DESCRIPTION: Renders a yellow line between points (415, 73) and (138, 245).
; PLAN: r0=415(x1), r1=73(y1), r2=138(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 73
LDI r2, 138
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
