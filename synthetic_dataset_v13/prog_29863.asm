; DESCRIPTION: Renders a green line between points (134, 173) and (141, 130).
; PLAN: r0=134(x1), r1=173(y1), r2=141(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 173
LDI r2, 141
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
