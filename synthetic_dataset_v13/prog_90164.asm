; DESCRIPTION: Renders a magenta line between points (9, 161) and (481, 74).
; PLAN: r0=9(x1), r1=161(y1), r2=481(x2), r3=74(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 161
LDI r2, 481
LDI r3, 74
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
