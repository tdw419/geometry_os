; DESCRIPTION: Renders a green line between points (427, 117) and (501, 81).
; PLAN: r0=427(x1), r1=117(y1), r2=501(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 117
LDI r2, 501
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
