; DESCRIPTION: Renders a magenta line between points (212, 77) and (206, 40).
; PLAN: r0=212(x1), r1=77(y1), r2=206(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 77
LDI r2, 206
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
