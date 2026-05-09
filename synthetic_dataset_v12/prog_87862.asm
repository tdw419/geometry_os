; DESCRIPTION: Renders a black line between points (248, 145) and (508, 210).
; PLAN: r0=248(x1), r1=145(y1), r2=508(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 145
LDI r2, 508
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
