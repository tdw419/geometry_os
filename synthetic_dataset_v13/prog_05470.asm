; DESCRIPTION: Renders a blue line between points (35, 214) and (48, 17).
; PLAN: r0=35(x1), r1=214(y1), r2=48(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 214
LDI r2, 48
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
