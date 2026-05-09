; DESCRIPTION: Renders a white line between points (145, 92) and (107, 23).
; PLAN: r0=145(x1), r1=92(y1), r2=107(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 92
LDI r2, 107
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
