; DESCRIPTION: Renders a yellow line between points (35, 156) and (415, 68).
; PLAN: r0=35(x1), r1=156(y1), r2=415(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 156
LDI r2, 415
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
