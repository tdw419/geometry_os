; DESCRIPTION: Renders a black line between points (6, 64) and (119, 126).
; PLAN: r0=6(x1), r1=64(y1), r2=119(x2), r3=126(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 64
LDI r2, 119
LDI r3, 126
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
