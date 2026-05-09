; DESCRIPTION: Draws a red line from (122, 3) to (92, 137).
; PLAN: r0=122(x1), r1=3(y1), r2=92(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 3
LDI r2, 92
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
