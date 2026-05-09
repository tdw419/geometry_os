; DESCRIPTION: Renders a green line between points (481, 194) and (250, 129).
; PLAN: r0=481(x1), r1=194(y1), r2=250(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 194
LDI r2, 250
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
