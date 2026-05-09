; DESCRIPTION: Renders a green line between points (126, 245) and (472, 145).
; PLAN: r0=126(x1), r1=245(y1), r2=472(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 245
LDI r2, 472
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
