; DESCRIPTION: Renders a black line between points (343, 6) and (218, 75).
; PLAN: r0=343(x1), r1=6(y1), r2=218(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 6
LDI r2, 218
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
