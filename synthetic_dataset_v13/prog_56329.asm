; DESCRIPTION: Renders a black line between points (231, 18) and (252, 162).
; PLAN: r0=231(x1), r1=18(y1), r2=252(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 18
LDI r2, 252
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
