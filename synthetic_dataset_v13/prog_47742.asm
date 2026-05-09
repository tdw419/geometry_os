; DESCRIPTION: Renders a white line between points (188, 92) and (361, 156).
; PLAN: r0=188(x1), r1=92(y1), r2=361(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 92
LDI r2, 361
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
