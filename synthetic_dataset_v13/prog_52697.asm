; DESCRIPTION: Renders a magenta line between points (220, 216) and (366, 12).
; PLAN: r0=220(x1), r1=216(y1), r2=366(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 216
LDI r2, 366
LDI r3, 12
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
