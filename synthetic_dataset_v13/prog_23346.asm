; DESCRIPTION: Draws a green line from (88, 83) to (323, 134).
; PLAN: r0=88(x1), r1=83(y1), r2=323(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 83
LDI r2, 323
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
