; DESCRIPTION: Renders a blue line between points (75, 66) and (441, 10).
; PLAN: r0=75(x1), r1=66(y1), r2=441(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 66
LDI r2, 441
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
