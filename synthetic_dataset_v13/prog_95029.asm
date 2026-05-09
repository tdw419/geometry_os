; DESCRIPTION: Draws a green line from (453, 47) to (221, 101).
; PLAN: r0=453(x1), r1=47(y1), r2=221(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 47
LDI r2, 221
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
