; DESCRIPTION: Renders a green line between points (147, 56) and (66, 37).
; PLAN: r0=147(x1), r1=56(y1), r2=66(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 56
LDI r2, 66
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
