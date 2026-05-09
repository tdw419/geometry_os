; DESCRIPTION: Renders a magenta line between points (393, 158) and (481, 161).
; PLAN: r0=393(x1), r1=158(y1), r2=481(x2), r3=161(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 158
LDI r2, 481
LDI r3, 161
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
