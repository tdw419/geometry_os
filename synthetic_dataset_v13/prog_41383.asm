; DESCRIPTION: Renders a magenta line between points (11, 76) and (53, 219).
; PLAN: r0=11(x1), r1=76(y1), r2=53(x2), r3=219(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 76
LDI r2, 53
LDI r3, 219
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
