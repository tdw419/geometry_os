; DESCRIPTION: Renders a blue line between points (408, 61) and (169, 68).
; PLAN: r0=408(x1), r1=61(y1), r2=169(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 61
LDI r2, 169
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
