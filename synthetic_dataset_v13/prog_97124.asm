; DESCRIPTION: Renders a magenta line between points (389, 184) and (68, 249).
; PLAN: r0=389(x1), r1=184(y1), r2=68(x2), r3=249(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 184
LDI r2, 68
LDI r3, 249
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
