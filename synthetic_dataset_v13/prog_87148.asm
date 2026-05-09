; DESCRIPTION: Renders a magenta line between points (53, 108) and (389, 75).
; PLAN: r0=53(x1), r1=108(y1), r2=389(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 108
LDI r2, 389
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
