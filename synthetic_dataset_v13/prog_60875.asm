; DESCRIPTION: Renders a magenta line between points (280, 61) and (22, 121).
; PLAN: r0=280(x1), r1=61(y1), r2=22(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 61
LDI r2, 22
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
