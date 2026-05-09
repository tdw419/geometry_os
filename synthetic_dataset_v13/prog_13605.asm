; DESCRIPTION: Places a green line segment connecting (17, 147) to (443, 138).
; PLAN: r0=17(x1), r1=147(y1), r2=443(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 147
LDI r2, 443
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
