; DESCRIPTION: Renders a magenta line between points (271, 6) and (105, 194).
; PLAN: r0=271(x1), r1=6(y1), r2=105(x2), r3=194(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 6
LDI r2, 105
LDI r3, 194
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
