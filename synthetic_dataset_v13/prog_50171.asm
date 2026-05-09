; DESCRIPTION: Renders a black line between points (193, 27) and (395, 51).
; PLAN: r0=193(x1), r1=27(y1), r2=395(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 27
LDI r2, 395
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
