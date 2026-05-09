; DESCRIPTION: Draws a red line from (204, 24) to (297, 47).
; PLAN: r0=204(x1), r1=24(y1), r2=297(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 24
LDI r2, 297
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
