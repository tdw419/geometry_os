; DESCRIPTION: Draws a red line from (22, 253) to (382, 122).
; PLAN: r0=22(x1), r1=253(y1), r2=382(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 253
LDI r2, 382
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
