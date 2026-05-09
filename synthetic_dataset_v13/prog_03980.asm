; DESCRIPTION: Draws a magenta line from (192, 100) to (329, 141).
; PLAN: r0=192(x1), r1=100(y1), r2=329(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 100
LDI r2, 329
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
