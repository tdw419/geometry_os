; DESCRIPTION: Renders a red line between points (257, 109) and (97, 20).
; PLAN: r0=257(x1), r1=109(y1), r2=97(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 109
LDI r2, 97
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
