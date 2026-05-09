; DESCRIPTION: Renders a blue line between points (102, 183) and (94, 113).
; PLAN: r0=102(x1), r1=183(y1), r2=94(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 183
LDI r2, 94
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
