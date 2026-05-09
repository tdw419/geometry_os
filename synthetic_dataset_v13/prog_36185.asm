; DESCRIPTION: Renders a green line between points (147, 149) and (442, 140).
; PLAN: r0=147(x1), r1=149(y1), r2=442(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 149
LDI r2, 442
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
