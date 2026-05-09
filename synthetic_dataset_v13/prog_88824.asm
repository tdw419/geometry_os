; DESCRIPTION: Renders a green line between points (306, 241) and (476, 136).
; PLAN: r0=306(x1), r1=241(y1), r2=476(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 241
LDI r2, 476
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
