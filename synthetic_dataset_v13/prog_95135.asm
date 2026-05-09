; DESCRIPTION: Renders a magenta line between points (206, 75) and (216, 164).
; PLAN: r0=206(x1), r1=75(y1), r2=216(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 75
LDI r2, 216
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
