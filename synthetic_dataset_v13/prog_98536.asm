; DESCRIPTION: Renders a green line between points (368, 169) and (153, 181).
; PLAN: r0=368(x1), r1=169(y1), r2=153(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 169
LDI r2, 153
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
