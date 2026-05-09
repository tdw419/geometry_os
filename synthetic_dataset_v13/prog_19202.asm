; DESCRIPTION: Renders a white line between points (153, 192) and (156, 1).
; PLAN: r0=153(x1), r1=192(y1), r2=156(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 192
LDI r2, 156
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
