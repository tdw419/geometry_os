; DESCRIPTION: Renders a green line between points (414, 107) and (438, 119).
; PLAN: r0=414(x1), r1=107(y1), r2=438(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 107
LDI r2, 438
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
