; DESCRIPTION: Draws a blue line from (153, 129) to (78, 135).
; PLAN: r0=153(x1), r1=129(y1), r2=78(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 129
LDI r2, 78
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
