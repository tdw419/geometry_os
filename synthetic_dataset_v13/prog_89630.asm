; DESCRIPTION: Renders a blue line between points (159, 156) and (445, 223).
; PLAN: r0=159(x1), r1=156(y1), r2=445(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 156
LDI r2, 445
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
