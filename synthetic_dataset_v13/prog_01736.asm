; DESCRIPTION: Renders a magenta line between points (482, 158) and (115, 29).
; PLAN: r0=482(x1), r1=158(y1), r2=115(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 158
LDI r2, 115
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
