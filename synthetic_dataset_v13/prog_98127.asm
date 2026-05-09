; DESCRIPTION: Draws a blue line from (76, 129) to (468, 8).
; PLAN: r0=76(x1), r1=129(y1), r2=468(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 129
LDI r2, 468
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
