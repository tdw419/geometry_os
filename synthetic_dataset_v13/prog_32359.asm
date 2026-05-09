; DESCRIPTION: Draws a magenta line from (430, 213) to (162, 36).
; PLAN: r0=430(x1), r1=213(y1), r2=162(x2), r3=36(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 213
LDI r2, 162
LDI r3, 36
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
