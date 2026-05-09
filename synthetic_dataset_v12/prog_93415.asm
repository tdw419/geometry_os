; DESCRIPTION: Renders a black line between points (343, 30) and (460, 176).
; PLAN: r0=343(x1), r1=30(y1), r2=460(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 30
LDI r2, 460
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
