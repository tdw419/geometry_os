; DESCRIPTION: Renders a black line between points (449, 178) and (22, 149).
; PLAN: r0=449(x1), r1=178(y1), r2=22(x2), r3=149(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 178
LDI r2, 22
LDI r3, 149
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
