; DESCRIPTION: Renders a green line between points (102, 140) and (374, 188).
; PLAN: r0=102(x1), r1=140(y1), r2=374(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 140
LDI r2, 374
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
