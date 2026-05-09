; DESCRIPTION: Renders a green line between points (354, 132) and (147, 51).
; PLAN: r0=354(x1), r1=132(y1), r2=147(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 132
LDI r2, 147
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
