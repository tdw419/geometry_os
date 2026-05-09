; DESCRIPTION: Renders a green line between points (257, 74) and (33, 197).
; PLAN: r0=257(x1), r1=74(y1), r2=33(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 74
LDI r2, 33
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
