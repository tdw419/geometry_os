; DESCRIPTION: Draws a blue line from (233, 149) to (124, 135).
; PLAN: r0=233(x1), r1=149(y1), r2=124(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 149
LDI r2, 124
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
