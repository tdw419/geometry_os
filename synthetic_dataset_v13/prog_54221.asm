; DESCRIPTION: Renders a black line between points (450, 131) and (471, 149).
; PLAN: r0=450(x1), r1=131(y1), r2=471(x2), r3=149(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 131
LDI r2, 471
LDI r3, 149
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
