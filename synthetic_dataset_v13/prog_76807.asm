; DESCRIPTION: Draws a white line from (458, 85) to (18, 204).
; PLAN: r0=458(x1), r1=85(y1), r2=18(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 85
LDI r2, 18
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
