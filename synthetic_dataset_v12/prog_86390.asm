; DESCRIPTION: Renders a orange line between points (257, 30) and (48, 202).
; PLAN: r0=257(x1), r1=30(y1), r2=48(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 30
LDI r2, 48
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
