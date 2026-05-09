; DESCRIPTION: Renders a black line between points (321, 151) and (83, 19).
; PLAN: r0=321(x1), r1=151(y1), r2=83(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 151
LDI r2, 83
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
