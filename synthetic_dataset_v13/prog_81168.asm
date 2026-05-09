; DESCRIPTION: Draws a white line from (145, 92) to (95, 237).
; PLAN: r0=145(x1), r1=92(y1), r2=95(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 92
LDI r2, 95
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
