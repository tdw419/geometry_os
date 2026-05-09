; DESCRIPTION: Draws a black line from (297, 53) to (149, 91).
; PLAN: r0=297(x1), r1=53(y1), r2=149(x2), r3=91(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 53
LDI r2, 149
LDI r3, 91
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
