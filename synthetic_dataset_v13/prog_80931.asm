; DESCRIPTION: Renders a magenta line between points (297, 57) and (254, 238).
; PLAN: r0=297(x1), r1=57(y1), r2=254(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 57
LDI r2, 254
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
