; DESCRIPTION: Renders a blue line between points (251, 45) and (30, 141).
; PLAN: r0=251(x1), r1=45(y1), r2=30(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 45
LDI r2, 30
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
