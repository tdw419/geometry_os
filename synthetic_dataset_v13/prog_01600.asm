; DESCRIPTION: Renders a red line between points (155, 40) and (313, 24).
; PLAN: r0=155(x1), r1=40(y1), r2=313(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 40
LDI r2, 313
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
