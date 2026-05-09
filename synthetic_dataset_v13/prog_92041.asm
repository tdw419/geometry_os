; DESCRIPTION: Renders a blue line between points (428, 129) and (418, 155).
; PLAN: r0=428(x1), r1=129(y1), r2=418(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 129
LDI r2, 418
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
