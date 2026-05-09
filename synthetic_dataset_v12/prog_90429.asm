; DESCRIPTION: Renders a green line between points (71, 147) and (98, 23).
; PLAN: r0=71(x1), r1=147(y1), r2=98(x2), r3=23(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 147
LDI r2, 98
LDI r3, 23
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
