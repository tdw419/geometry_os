; DESCRIPTION: Draws a green line from (142, 249) to (486, 58).
; PLAN: r0=142(x1), r1=249(y1), r2=486(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 249
LDI r2, 486
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
