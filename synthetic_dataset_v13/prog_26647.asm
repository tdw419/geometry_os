; DESCRIPTION: Renders a magenta line between points (233, 138) and (39, 88).
; PLAN: r0=233(x1), r1=138(y1), r2=39(x2), r3=88(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 138
LDI r2, 39
LDI r3, 88
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
