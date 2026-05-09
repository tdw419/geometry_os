; DESCRIPTION: Renders a magenta line between points (74, 189) and (96, 5).
; PLAN: r0=74(x1), r1=189(y1), r2=96(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 189
LDI r2, 96
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
