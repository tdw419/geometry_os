; DESCRIPTION: Renders a magenta line between points (317, 106) and (271, 140).
; PLAN: r0=317(x1), r1=106(y1), r2=271(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 106
LDI r2, 271
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
