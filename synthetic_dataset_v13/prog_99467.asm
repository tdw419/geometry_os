; DESCRIPTION: Renders a white line between points (247, 92) and (49, 212).
; PLAN: r0=247(x1), r1=92(y1), r2=49(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 92
LDI r2, 49
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
