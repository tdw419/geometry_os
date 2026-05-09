; DESCRIPTION: Renders a white line between points (179, 27) and (257, 193).
; PLAN: r0=179(x1), r1=27(y1), r2=257(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 27
LDI r2, 257
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
