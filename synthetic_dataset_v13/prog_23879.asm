; DESCRIPTION: Renders a green line between points (147, 33) and (56, 107).
; PLAN: r0=147(x1), r1=33(y1), r2=56(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 33
LDI r2, 56
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
