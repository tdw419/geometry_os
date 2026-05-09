; DESCRIPTION: Draws a magenta line from (461, 10) to (263, 22).
; PLAN: r0=461(x1), r1=10(y1), r2=263(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 10
LDI r2, 263
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
