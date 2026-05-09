; DESCRIPTION: Renders a magenta line between points (141, 188) and (301, 36).
; PLAN: r0=141(x1), r1=188(y1), r2=301(x2), r3=36(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 188
LDI r2, 301
LDI r3, 36
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
