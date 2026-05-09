; DESCRIPTION: Renders a black line between points (467, 95) and (26, 91).
; PLAN: r0=467(x1), r1=95(y1), r2=26(x2), r3=91(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 95
LDI r2, 26
LDI r3, 91
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
