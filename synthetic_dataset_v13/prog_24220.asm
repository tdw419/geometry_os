; DESCRIPTION: Renders a yellow line between points (257, 162) and (361, 224).
; PLAN: r0=257(x1), r1=162(y1), r2=361(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 162
LDI r2, 361
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
