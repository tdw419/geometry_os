; DESCRIPTION: Renders a magenta line between points (186, 31) and (257, 50).
; PLAN: r0=186(x1), r1=31(y1), r2=257(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 31
LDI r2, 257
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
