; DESCRIPTION: Draws a red line from (19, 207) to (245, 100).
; PLAN: r0=19(x1), r1=207(y1), r2=245(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 207
LDI r2, 245
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
