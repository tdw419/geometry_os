; DESCRIPTION: Renders a magenta line between points (252, 8) and (477, 152).
; PLAN: r0=252(x1), r1=8(y1), r2=477(x2), r3=152(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 8
LDI r2, 477
LDI r3, 152
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
