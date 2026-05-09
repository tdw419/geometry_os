; DESCRIPTION: Renders a blue line between points (213, 212) and (469, 135).
; PLAN: r0=213(x1), r1=212(y1), r2=469(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 212
LDI r2, 469
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
