; DESCRIPTION: Renders a blue line between points (257, 94) and (294, 41).
; PLAN: r0=257(x1), r1=94(y1), r2=294(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 94
LDI r2, 294
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
