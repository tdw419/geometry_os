; DESCRIPTION: Renders a magenta line between points (223, 243) and (22, 47).
; PLAN: r0=223(x1), r1=243(y1), r2=22(x2), r3=47(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 243
LDI r2, 22
LDI r3, 47
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
