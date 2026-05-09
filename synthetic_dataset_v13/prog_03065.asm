; DESCRIPTION: Renders a magenta line between points (207, 55) and (185, 133).
; PLAN: r0=207(x1), r1=55(y1), r2=185(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 55
LDI r2, 185
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
