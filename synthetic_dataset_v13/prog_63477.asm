; DESCRIPTION: Renders a magenta line between points (408, 58) and (119, 18).
; PLAN: r0=408(x1), r1=58(y1), r2=119(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 58
LDI r2, 119
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
