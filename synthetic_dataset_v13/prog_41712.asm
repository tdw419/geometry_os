; DESCRIPTION: Draws a blue line from (33, 106) to (49, 202).
; PLAN: r0=33(x1), r1=106(y1), r2=49(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 106
LDI r2, 49
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
