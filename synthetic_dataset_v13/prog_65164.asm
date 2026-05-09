; DESCRIPTION: Renders a magenta line between points (481, 115) and (117, 189).
; PLAN: r0=481(x1), r1=115(y1), r2=117(x2), r3=189(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 115
LDI r2, 117
LDI r3, 189
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
