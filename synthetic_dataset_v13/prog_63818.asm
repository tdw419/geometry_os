; DESCRIPTION: Draws a blue line from (130, 112) to (190, 77).
; PLAN: r0=130(x1), r1=112(y1), r2=190(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 112
LDI r2, 190
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
