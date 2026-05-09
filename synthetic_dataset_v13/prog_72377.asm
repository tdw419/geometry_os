; DESCRIPTION: Renders a magenta line between points (141, 54) and (131, 28).
; PLAN: r0=141(x1), r1=54(y1), r2=131(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 54
LDI r2, 131
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
