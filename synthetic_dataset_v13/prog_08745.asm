; DESCRIPTION: Renders a black line between points (279, 134) and (193, 89).
; PLAN: r0=279(x1), r1=134(y1), r2=193(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 134
LDI r2, 193
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
