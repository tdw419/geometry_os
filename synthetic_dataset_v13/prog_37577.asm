; DESCRIPTION: Renders a black line between points (8, 85) and (220, 151).
; PLAN: r0=8(x1), r1=85(y1), r2=220(x2), r3=151(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 85
LDI r2, 220
LDI r3, 151
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
