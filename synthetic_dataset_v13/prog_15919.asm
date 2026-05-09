; DESCRIPTION: Renders a white line between points (158, 35) and (0, 39).
; PLAN: r0=158(x1), r1=35(y1), r2=0(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 35
LDI r2, 0
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
