; DESCRIPTION: Renders a magenta line between points (437, 141) and (26, 17).
; PLAN: r0=437(x1), r1=141(y1), r2=26(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 141
LDI r2, 26
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
