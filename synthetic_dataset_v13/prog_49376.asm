; DESCRIPTION: Renders a magenta line between points (24, 226) and (257, 169).
; PLAN: r0=24(x1), r1=226(y1), r2=257(x2), r3=169(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 226
LDI r2, 257
LDI r3, 169
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
