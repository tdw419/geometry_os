; DESCRIPTION: Renders a red line between points (321, 92) and (425, 23).
; PLAN: r0=321(x1), r1=92(y1), r2=425(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 92
LDI r2, 425
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
