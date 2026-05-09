; DESCRIPTION: Renders a magenta line between points (434, 169) and (280, 119).
; PLAN: r0=434(x1), r1=169(y1), r2=280(x2), r3=119(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 169
LDI r2, 280
LDI r3, 119
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
