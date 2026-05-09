; DESCRIPTION: Places a white line segment connecting (96, 169) to (362, 249).
; PLAN: r0=96(x1), r1=169(y1), r2=362(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 169
LDI r2, 362
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
