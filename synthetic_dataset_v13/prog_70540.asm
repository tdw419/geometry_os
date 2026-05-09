; DESCRIPTION: Renders a blue line between points (412, 87) and (371, 83).
; PLAN: r0=412(x1), r1=87(y1), r2=371(x2), r3=83(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 87
LDI r2, 371
LDI r3, 83
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
