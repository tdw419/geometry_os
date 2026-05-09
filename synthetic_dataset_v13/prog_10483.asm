; DESCRIPTION: Renders a magenta line between points (59, 62) and (161, 34).
; PLAN: r0=59(x1), r1=62(y1), r2=161(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 62
LDI r2, 161
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
