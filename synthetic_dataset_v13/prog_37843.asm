; DESCRIPTION: Renders a blue line between points (344, 3) and (36, 194).
; PLAN: r0=344(x1), r1=3(y1), r2=36(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 3
LDI r2, 36
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
