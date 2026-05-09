; DESCRIPTION: Renders a blue line between points (0, 77) and (437, 156).
; PLAN: r0=0(x1), r1=77(y1), r2=437(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 77
LDI r2, 437
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
