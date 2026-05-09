; DESCRIPTION: Renders a magenta line between points (237, 68) and (477, 14).
; PLAN: r0=237(x1), r1=68(y1), r2=477(x2), r3=14(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 68
LDI r2, 477
LDI r3, 14
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
