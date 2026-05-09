; DESCRIPTION: Draws a purple line from (33, 81) to (333, 92).
; PLAN: r0=33(x1), r1=81(y1), r2=333(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 81
LDI r2, 333
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
