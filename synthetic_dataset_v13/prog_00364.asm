; DESCRIPTION: Renders a black line between points (87, 158) and (443, 86).
; PLAN: r0=87(x1), r1=158(y1), r2=443(x2), r3=86(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 158
LDI r2, 443
LDI r3, 86
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
