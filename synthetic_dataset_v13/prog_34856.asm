; DESCRIPTION: Draws a red line from (58, 22) to (7, 204).
; PLAN: r0=58(x1), r1=22(y1), r2=7(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 22
LDI r2, 7
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
