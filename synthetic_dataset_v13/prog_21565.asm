; DESCRIPTION: Draws a blue line from (298, 178) to (314, 88).
; PLAN: r0=298(x1), r1=178(y1), r2=314(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 178
LDI r2, 314
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
