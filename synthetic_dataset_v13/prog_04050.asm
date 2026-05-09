; DESCRIPTION: Renders a white line between points (338, 139) and (257, 2).
; PLAN: r0=338(x1), r1=139(y1), r2=257(x2), r3=2(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 139
LDI r2, 257
LDI r3, 2
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
