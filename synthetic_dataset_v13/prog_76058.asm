; DESCRIPTION: Renders a blue line between points (4, 96) and (367, 211).
; PLAN: r0=4(x1), r1=96(y1), r2=367(x2), r3=211(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 96
LDI r2, 367
LDI r3, 211
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
