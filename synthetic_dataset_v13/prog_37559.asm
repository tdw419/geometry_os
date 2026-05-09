; DESCRIPTION: Draws a white line from (361, 92) to (91, 130).
; PLAN: r0=361(x1), r1=92(y1), r2=91(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 92
LDI r2, 91
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
