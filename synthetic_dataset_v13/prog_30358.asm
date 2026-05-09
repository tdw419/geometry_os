; DESCRIPTION: Draws a red line from (221, 3) to (433, 11).
; PLAN: r0=221(x1), r1=3(y1), r2=433(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 3
LDI r2, 433
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
