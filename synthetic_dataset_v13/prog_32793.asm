; DESCRIPTION: Renders a blue line between points (169, 75) and (217, 32).
; PLAN: r0=169(x1), r1=75(y1), r2=217(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 75
LDI r2, 217
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
