; DESCRIPTION: Renders a blue line between points (401, 183) and (486, 99).
; PLAN: r0=401(x1), r1=183(y1), r2=486(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 183
LDI r2, 486
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
