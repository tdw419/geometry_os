; DESCRIPTION: Renders a green line between points (472, 160) and (257, 254).
; PLAN: r0=472(x1), r1=160(y1), r2=257(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 160
LDI r2, 257
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
