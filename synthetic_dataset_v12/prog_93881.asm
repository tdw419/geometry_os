; DESCRIPTION: Renders a blue line between points (219, 206) and (264, 196).
; PLAN: r0=219(x1), r1=206(y1), r2=264(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 206
LDI r2, 264
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
