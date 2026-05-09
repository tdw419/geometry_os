; DESCRIPTION: Draws a blue line from (112, 224) to (510, 131).
; PLAN: r0=112(x1), r1=224(y1), r2=510(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 224
LDI r2, 510
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
