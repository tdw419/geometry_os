; DESCRIPTION: Renders a red line between points (4, 53) and (19, 22).
; PLAN: r0=4(x1), r1=53(y1), r2=19(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 53
LDI r2, 19
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
