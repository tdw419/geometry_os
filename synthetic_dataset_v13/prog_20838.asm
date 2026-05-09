; DESCRIPTION: Renders a black line between points (343, 173) and (449, 145).
; PLAN: r0=343(x1), r1=173(y1), r2=449(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 173
LDI r2, 449
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
