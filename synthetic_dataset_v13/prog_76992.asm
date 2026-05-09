; DESCRIPTION: Renders a blue line between points (371, 168) and (223, 104).
; PLAN: r0=371(x1), r1=168(y1), r2=223(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 168
LDI r2, 223
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
