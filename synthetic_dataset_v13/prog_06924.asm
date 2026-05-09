; DESCRIPTION: Renders a magenta line between points (12, 210) and (200, 34).
; PLAN: r0=12(x1), r1=210(y1), r2=200(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 210
LDI r2, 200
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
