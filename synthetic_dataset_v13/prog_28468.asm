; DESCRIPTION: Renders a cyan line between points (363, 101) and (257, 79).
; PLAN: r0=363(x1), r1=101(y1), r2=257(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 101
LDI r2, 257
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
