; DESCRIPTION: Renders a magenta line between points (53, 126) and (501, 49).
; PLAN: r0=53(x1), r1=126(y1), r2=501(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 126
LDI r2, 501
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
