; DESCRIPTION: Renders a magenta line between points (81, 238) and (330, 100).
; PLAN: r0=81(x1), r1=238(y1), r2=330(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 238
LDI r2, 330
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
