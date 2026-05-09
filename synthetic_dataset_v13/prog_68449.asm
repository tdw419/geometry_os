; DESCRIPTION: Renders a black line between points (463, 184) and (294, 6).
; PLAN: r0=463(x1), r1=184(y1), r2=294(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 184
LDI r2, 294
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
