; DESCRIPTION: Renders a green line between points (255, 2) and (257, 60).
; PLAN: r0=255(x1), r1=2(y1), r2=257(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 2
LDI r2, 257
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
