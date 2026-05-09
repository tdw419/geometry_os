; DESCRIPTION: Renders a blue line between points (392, 129) and (222, 43).
; PLAN: r0=392(x1), r1=129(y1), r2=222(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 129
LDI r2, 222
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
