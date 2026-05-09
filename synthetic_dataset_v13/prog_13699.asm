; DESCRIPTION: Renders a green line between points (79, 171) and (325, 147).
; PLAN: r0=79(x1), r1=171(y1), r2=325(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 171
LDI r2, 325
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
