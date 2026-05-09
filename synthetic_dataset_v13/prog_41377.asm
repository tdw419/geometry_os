; DESCRIPTION: Renders a magenta line between points (326, 216) and (350, 164).
; PLAN: r0=326(x1), r1=216(y1), r2=350(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 216
LDI r2, 350
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
