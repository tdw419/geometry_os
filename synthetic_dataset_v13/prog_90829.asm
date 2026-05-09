; DESCRIPTION: Renders a magenta line between points (311, 17) and (304, 170).
; PLAN: r0=311(x1), r1=17(y1), r2=304(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 17
LDI r2, 304
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
