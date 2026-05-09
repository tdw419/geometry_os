; DESCRIPTION: Renders a magenta line between points (11, 148) and (317, 87).
; PLAN: r0=11(x1), r1=148(y1), r2=317(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 148
LDI r2, 317
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
