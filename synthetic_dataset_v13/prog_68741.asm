; DESCRIPTION: Renders a magenta line between points (66, 198) and (257, 255).
; PLAN: r0=66(x1), r1=198(y1), r2=257(x2), r3=255(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 198
LDI r2, 257
LDI r3, 255
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
