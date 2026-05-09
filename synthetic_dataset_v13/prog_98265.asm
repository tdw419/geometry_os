; DESCRIPTION: Renders a magenta line between points (10, 114) and (317, 45).
; PLAN: r0=10(x1), r1=114(y1), r2=317(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 114
LDI r2, 317
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
