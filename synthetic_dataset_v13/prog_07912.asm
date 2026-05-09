; DESCRIPTION: Renders a yellow line between points (177, 173) and (501, 159).
; PLAN: r0=177(x1), r1=173(y1), r2=501(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 173
LDI r2, 501
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
