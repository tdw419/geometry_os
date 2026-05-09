; DESCRIPTION: Draws a green line from (232, 138) to (62, 114).
; PLAN: r0=232(x1), r1=138(y1), r2=62(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 138
LDI r2, 62
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
