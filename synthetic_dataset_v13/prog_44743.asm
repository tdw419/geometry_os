; DESCRIPTION: Draws a magenta line from (377, 1) to (50, 20).
; PLAN: r0=377(x1), r1=1(y1), r2=50(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 1
LDI r2, 50
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
