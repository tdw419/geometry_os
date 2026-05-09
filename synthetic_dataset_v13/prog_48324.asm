; DESCRIPTION: Draws a green line from (382, 11) to (472, 112).
; PLAN: r0=382(x1), r1=11(y1), r2=472(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 11
LDI r2, 472
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
