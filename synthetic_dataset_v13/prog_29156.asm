; DESCRIPTION: Draws a blue line from (461, 77) to (279, 224).
; PLAN: r0=461(x1), r1=77(y1), r2=279(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 77
LDI r2, 279
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
