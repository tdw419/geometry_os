; DESCRIPTION: Renders a white line between points (257, 118) and (8, 2).
; PLAN: r0=257(x1), r1=118(y1), r2=8(x2), r3=2(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 118
LDI r2, 8
LDI r3, 2
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
