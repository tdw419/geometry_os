; DESCRIPTION: Renders a black line between points (80, 53) and (349, 193).
; PLAN: r0=80(x1), r1=53(y1), r2=349(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 53
LDI r2, 349
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
