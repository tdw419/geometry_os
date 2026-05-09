; DESCRIPTION: Draws a blue line from (48, 129) to (83, 233).
; PLAN: r0=48(x1), r1=129(y1), r2=83(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 129
LDI r2, 83
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
