; DESCRIPTION: Draws a magenta line from (329, 88) to (93, 225).
; PLAN: r0=329(x1), r1=88(y1), r2=93(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 88
LDI r2, 93
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
