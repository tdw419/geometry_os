; DESCRIPTION: Draws a magenta line from (400, 72) to (75, 232).
; PLAN: r0=400(x1), r1=72(y1), r2=75(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 72
LDI r2, 75
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
