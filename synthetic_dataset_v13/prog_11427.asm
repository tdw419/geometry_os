; DESCRIPTION: Renders a magenta line between points (64, 89) and (220, 230).
; PLAN: r0=64(x1), r1=89(y1), r2=220(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 89
LDI r2, 220
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
