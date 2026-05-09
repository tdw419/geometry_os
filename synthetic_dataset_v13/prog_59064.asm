; DESCRIPTION: Renders a black line between points (162, 101) and (231, 120).
; PLAN: r0=162(x1), r1=101(y1), r2=231(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 101
LDI r2, 231
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
