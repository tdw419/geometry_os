; DESCRIPTION: Renders a black line between points (8, 180) and (345, 176).
; PLAN: r0=8(x1), r1=180(y1), r2=345(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 180
LDI r2, 345
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
