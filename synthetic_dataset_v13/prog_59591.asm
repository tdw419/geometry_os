; DESCRIPTION: Renders a magenta line between points (1, 103) and (423, 180).
; PLAN: r0=1(x1), r1=103(y1), r2=423(x2), r3=180(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 103
LDI r2, 423
LDI r3, 180
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
