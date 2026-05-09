; DESCRIPTION: Renders a blue line between points (414, 88) and (228, 64).
; PLAN: r0=414(x1), r1=88(y1), r2=228(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 88
LDI r2, 228
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
