; DESCRIPTION: Renders a yellow line between points (257, 85) and (481, 226).
; PLAN: r0=257(x1), r1=85(y1), r2=481(x2), r3=226(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 85
LDI r2, 481
LDI r3, 226
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
