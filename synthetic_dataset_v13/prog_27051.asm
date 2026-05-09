; DESCRIPTION: Renders a magenta line between points (302, 131) and (182, 144).
; PLAN: r0=302(x1), r1=131(y1), r2=182(x2), r3=144(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 131
LDI r2, 182
LDI r3, 144
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
