; DESCRIPTION: Places a blue line segment connecting (45, 210) to (95, 4).
; PLAN: r0=45(x1), r1=210(y1), r2=95(x2), r3=4(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 210
LDI r2, 95
LDI r3, 4
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
