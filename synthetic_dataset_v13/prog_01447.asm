; DESCRIPTION: Places a red line segment connecting (362, 147) to (486, 175).
; PLAN: r0=362(x1), r1=147(y1), r2=486(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 147
LDI r2, 486
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
