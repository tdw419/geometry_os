; DESCRIPTION: Draws a magenta line from (350, 10) to (339, 92).
; PLAN: r0=350(x1), r1=10(y1), r2=339(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 10
LDI r2, 339
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
