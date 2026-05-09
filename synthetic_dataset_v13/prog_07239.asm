; DESCRIPTION: Renders a magenta line between points (33, 121) and (509, 238).
; PLAN: r0=33(x1), r1=121(y1), r2=509(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 121
LDI r2, 509
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
