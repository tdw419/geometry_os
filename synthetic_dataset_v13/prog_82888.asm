; DESCRIPTION: Draws a white line from (47, 247) to (92, 101).
; PLAN: r0=47(x1), r1=247(y1), r2=92(x2), r3=101(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 247
LDI r2, 92
LDI r3, 101
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
