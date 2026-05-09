; DESCRIPTION: Renders a black line between points (311, 223) and (2, 249).
; PLAN: r0=311(x1), r1=223(y1), r2=2(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 223
LDI r2, 2
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
