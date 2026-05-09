; DESCRIPTION: Renders a yellow line between points (128, 92) and (257, 207).
; PLAN: r0=128(x1), r1=92(y1), r2=257(x2), r3=207(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 92
LDI r2, 257
LDI r3, 207
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
