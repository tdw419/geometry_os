; DESCRIPTION: Renders a magenta line between points (377, 67) and (31, 73).
; PLAN: r0=377(x1), r1=67(y1), r2=31(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 67
LDI r2, 31
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
