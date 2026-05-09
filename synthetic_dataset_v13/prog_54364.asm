; DESCRIPTION: Draws a blue line from (3, 112) to (290, 135).
; PLAN: r0=3(x1), r1=112(y1), r2=290(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 112
LDI r2, 290
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
