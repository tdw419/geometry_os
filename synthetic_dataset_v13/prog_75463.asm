; DESCRIPTION: Renders a magenta line between points (184, 110) and (358, 32).
; PLAN: r0=184(x1), r1=110(y1), r2=358(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 110
LDI r2, 358
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
