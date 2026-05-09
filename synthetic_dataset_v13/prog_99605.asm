; DESCRIPTION: Draws a black line from (140, 4) to (466, 92).
; PLAN: r0=140(x1), r1=4(y1), r2=466(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 4
LDI r2, 466
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
