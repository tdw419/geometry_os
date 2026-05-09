; DESCRIPTION: Renders a blue line between points (453, 156) and (75, 95).
; PLAN: r0=453(x1), r1=156(y1), r2=75(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 156
LDI r2, 75
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
