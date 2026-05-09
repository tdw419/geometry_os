; DESCRIPTION: Renders a magenta line between points (153, 40) and (473, 193).
; PLAN: r0=153(x1), r1=40(y1), r2=473(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 40
LDI r2, 473
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
