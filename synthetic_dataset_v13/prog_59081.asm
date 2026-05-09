; DESCRIPTION: Renders a green line between points (24, 120) and (257, 98).
; PLAN: r0=24(x1), r1=120(y1), r2=257(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 120
LDI r2, 257
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
