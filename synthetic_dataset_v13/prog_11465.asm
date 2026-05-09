; DESCRIPTION: Renders a magenta line between points (161, 145) and (317, 180).
; PLAN: r0=161(x1), r1=145(y1), r2=317(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 145
LDI r2, 317
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
