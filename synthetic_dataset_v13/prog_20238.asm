; DESCRIPTION: Places a blue line segment connecting (368, 210) to (486, 85).
; PLAN: r0=368(x1), r1=210(y1), r2=486(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 210
LDI r2, 486
LDI r3, 85
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
