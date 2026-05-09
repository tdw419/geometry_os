; DESCRIPTION: Draws a red line from (139, 112) to (458, 87).
; PLAN: r0=139(x1), r1=112(y1), r2=458(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 112
LDI r2, 458
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
