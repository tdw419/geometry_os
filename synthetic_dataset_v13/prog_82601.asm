; DESCRIPTION: Draws a yellow line from (438, 89) to (53, 115).
; PLAN: r0=438(x1), r1=89(y1), r2=53(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 89
LDI r2, 53
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
