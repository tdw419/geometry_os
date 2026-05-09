; DESCRIPTION: Renders a magenta line between points (455, 134) and (361, 20).
; PLAN: r0=455(x1), r1=134(y1), r2=361(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 134
LDI r2, 361
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
