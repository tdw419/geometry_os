; DESCRIPTION: Renders a blue line between points (288, 183) and (45, 95).
; PLAN: r0=288(x1), r1=183(y1), r2=45(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 183
LDI r2, 45
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
