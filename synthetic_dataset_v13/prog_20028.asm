; DESCRIPTION: Draws a white line from (222, 2) to (376, 177).
; PLAN: r0=222(x1), r1=2(y1), r2=376(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 2
LDI r2, 376
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
