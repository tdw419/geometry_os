; DESCRIPTION: Renders a black line between points (52, 229) and (115, 139).
; PLAN: r0=52(x1), r1=229(y1), r2=115(x2), r3=139(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 229
LDI r2, 115
LDI r3, 139
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
