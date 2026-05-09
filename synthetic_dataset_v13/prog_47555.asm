; DESCRIPTION: Renders a magenta line between points (317, 61) and (103, 185).
; PLAN: r0=317(x1), r1=61(y1), r2=103(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 61
LDI r2, 103
LDI r3, 185
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
