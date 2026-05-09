; DESCRIPTION: Draws a magenta line from (430, 94) to (338, 28).
; PLAN: r0=430(x1), r1=94(y1), r2=338(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 94
LDI r2, 338
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
