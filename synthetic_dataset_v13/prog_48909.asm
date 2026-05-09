; DESCRIPTION: Renders a blue line between points (10, 165) and (48, 219).
; PLAN: r0=10(x1), r1=165(y1), r2=48(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 165
LDI r2, 48
LDI r3, 219
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
