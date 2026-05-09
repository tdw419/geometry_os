; DESCRIPTION: Draws a red line from (289, 204) to (490, 16).
; PLAN: r0=289(x1), r1=204(y1), r2=490(x2), r3=16(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 204
LDI r2, 490
LDI r3, 16
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
