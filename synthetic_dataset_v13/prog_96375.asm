; DESCRIPTION: Draws a red line from (504, 142) to (297, 72).
; PLAN: r0=504(x1), r1=142(y1), r2=297(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 142
LDI r2, 297
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
