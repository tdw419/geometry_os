; DESCRIPTION: Draws a red line from (29, 115) to (101, 21).
; PLAN: r0=29(x1), r1=115(y1), r2=101(x2), r3=21(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 115
LDI r2, 101
LDI r3, 21
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
