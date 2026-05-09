; DESCRIPTION: Renders a magenta line between points (437, 106) and (317, 133).
; PLAN: r0=437(x1), r1=106(y1), r2=317(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 106
LDI r2, 317
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
