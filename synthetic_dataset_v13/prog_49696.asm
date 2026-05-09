; DESCRIPTION: Renders a black line between points (50, 187) and (194, 50).
; PLAN: r0=50(x1), r1=187(y1), r2=194(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 187
LDI r2, 194
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
