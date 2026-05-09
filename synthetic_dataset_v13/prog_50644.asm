; DESCRIPTION: Renders a magenta line between points (141, 175) and (91, 170).
; PLAN: r0=141(x1), r1=175(y1), r2=91(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 175
LDI r2, 91
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
