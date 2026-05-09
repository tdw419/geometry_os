; DESCRIPTION: Renders a black line between points (345, 146) and (349, 100).
; PLAN: r0=345(x1), r1=146(y1), r2=349(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 146
LDI r2, 349
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
