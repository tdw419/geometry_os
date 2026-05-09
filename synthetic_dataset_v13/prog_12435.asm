; DESCRIPTION: Renders a black line between points (308, 184) and (473, 37).
; PLAN: r0=308(x1), r1=184(y1), r2=473(x2), r3=37(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 184
LDI r2, 473
LDI r3, 37
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
