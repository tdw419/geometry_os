; DESCRIPTION: Renders a blue line between points (223, 21) and (480, 197).
; PLAN: r0=223(x1), r1=21(y1), r2=480(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 21
LDI r2, 480
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
