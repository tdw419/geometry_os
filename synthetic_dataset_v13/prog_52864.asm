; DESCRIPTION: Places a green line segment connecting (315, 158) to (446, 51).
; PLAN: r0=315(x1), r1=158(y1), r2=446(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 158
LDI r2, 446
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
