; DESCRIPTION: Renders a magenta line between points (361, 134) and (442, 35).
; PLAN: r0=361(x1), r1=134(y1), r2=442(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 134
LDI r2, 442
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
