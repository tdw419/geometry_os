; DESCRIPTION: Draws a magenta line from (377, 245) to (60, 49).
; PLAN: r0=377(x1), r1=245(y1), r2=60(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 245
LDI r2, 60
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
