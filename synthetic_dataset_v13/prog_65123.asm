; DESCRIPTION: Renders a black line between points (25, 24) and (223, 167).
; PLAN: r0=25(x1), r1=24(y1), r2=223(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 24
LDI r2, 223
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
