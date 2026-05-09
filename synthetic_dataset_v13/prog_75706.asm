; DESCRIPTION: Renders a magenta line between points (77, 210) and (395, 189).
; PLAN: r0=77(x1), r1=210(y1), r2=395(x2), r3=189(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 210
LDI r2, 395
LDI r3, 189
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
