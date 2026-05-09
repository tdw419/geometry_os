; DESCRIPTION: Renders a blue line between points (32, 97) and (38, 32).
; PLAN: r0=32(x1), r1=97(y1), r2=38(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 97
LDI r2, 38
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
