; DESCRIPTION: Renders a magenta line between points (473, 0) and (385, 25).
; PLAN: r0=473(x1), r1=0(y1), r2=385(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 0
LDI r2, 385
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
