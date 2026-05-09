; DESCRIPTION: Renders a red line between points (133, 127) and (91, 140).
; PLAN: r0=133(x1), r1=127(y1), r2=91(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 127
LDI r2, 91
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
