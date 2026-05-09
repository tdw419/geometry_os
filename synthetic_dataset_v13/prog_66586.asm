; DESCRIPTION: Renders a magenta line between points (211, 24) and (287, 71).
; PLAN: r0=211(x1), r1=24(y1), r2=287(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 24
LDI r2, 287
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
