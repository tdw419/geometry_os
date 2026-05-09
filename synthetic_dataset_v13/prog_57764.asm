; DESCRIPTION: Renders a black line between points (309, 100) and (408, 43).
; PLAN: r0=309(x1), r1=100(y1), r2=408(x2), r3=43(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 100
LDI r2, 408
LDI r3, 43
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
