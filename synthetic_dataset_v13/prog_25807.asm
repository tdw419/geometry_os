; DESCRIPTION: Renders a black line between points (415, 156) and (179, 29).
; PLAN: r0=415(x1), r1=156(y1), r2=179(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 156
LDI r2, 179
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
