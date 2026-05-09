; DESCRIPTION: Renders a yellow line between points (201, 180) and (257, 174).
; PLAN: r0=201(x1), r1=180(y1), r2=257(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 180
LDI r2, 257
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
