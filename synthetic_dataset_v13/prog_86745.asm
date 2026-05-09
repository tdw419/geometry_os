; DESCRIPTION: Renders a green line between points (169, 188) and (130, 176).
; PLAN: r0=169(x1), r1=188(y1), r2=130(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 188
LDI r2, 130
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
