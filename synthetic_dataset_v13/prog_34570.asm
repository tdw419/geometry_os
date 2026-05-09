; DESCRIPTION: Renders a red line between points (163, 53) and (127, 22).
; PLAN: r0=163(x1), r1=53(y1), r2=127(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 53
LDI r2, 127
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
