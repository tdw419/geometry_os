; DESCRIPTION: Draws a red line from (281, 72) to (200, 129).
; PLAN: r0=281(x1), r1=72(y1), r2=200(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 72
LDI r2, 200
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
