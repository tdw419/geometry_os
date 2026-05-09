; DESCRIPTION: Renders a cyan line between points (155, 72) and (257, 226).
; PLAN: r0=155(x1), r1=72(y1), r2=257(x2), r3=226(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 72
LDI r2, 257
LDI r3, 226
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
