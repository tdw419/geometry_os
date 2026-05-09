; DESCRIPTION: Renders a magenta line between points (214, 140) and (473, 197).
; PLAN: r0=214(x1), r1=140(y1), r2=473(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 140
LDI r2, 473
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
