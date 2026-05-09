; DESCRIPTION: Renders a red line between points (127, 40) and (54, 119).
; PLAN: r0=127(x1), r1=40(y1), r2=54(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 40
LDI r2, 54
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
