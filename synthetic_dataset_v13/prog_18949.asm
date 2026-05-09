; DESCRIPTION: Draws a red line from (478, 196) to (101, 163).
; PLAN: r0=478(x1), r1=196(y1), r2=101(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 196
LDI r2, 101
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
