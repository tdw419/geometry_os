; DESCRIPTION: Draws a magenta line from (28, 167) to (19, 4).
; PLAN: r0=28(x1), r1=167(y1), r2=19(x2), r3=4(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 167
LDI r2, 19
LDI r3, 4
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
