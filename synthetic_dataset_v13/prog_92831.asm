; DESCRIPTION: Draws a magenta line from (133, 130) to (94, 76).
; PLAN: r0=133(x1), r1=130(y1), r2=94(x2), r3=76(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 130
LDI r2, 94
LDI r3, 76
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
