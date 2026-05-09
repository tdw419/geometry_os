; DESCRIPTION: Renders a magenta line between points (89, 54) and (342, 30).
; PLAN: r0=89(x1), r1=54(y1), r2=342(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 54
LDI r2, 342
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
