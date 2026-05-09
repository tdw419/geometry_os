; DESCRIPTION: Draws a magenta line from (419, 134) to (130, 150).
; PLAN: r0=419(x1), r1=134(y1), r2=130(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 134
LDI r2, 130
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
