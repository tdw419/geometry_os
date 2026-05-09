; DESCRIPTION: Renders a green line between points (41, 147) and (443, 126).
; PLAN: r0=41(x1), r1=147(y1), r2=443(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 147
LDI r2, 443
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
