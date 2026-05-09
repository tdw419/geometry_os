; DESCRIPTION: Renders a blue line between points (204, 75) and (207, 8).
; PLAN: r0=204(x1), r1=75(y1), r2=207(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 75
LDI r2, 207
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
