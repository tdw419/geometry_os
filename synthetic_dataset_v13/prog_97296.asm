; DESCRIPTION: Draws a red line from (137, 189) to (475, 14).
; PLAN: r0=137(x1), r1=189(y1), r2=475(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 189
LDI r2, 475
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
