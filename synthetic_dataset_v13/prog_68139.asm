; DESCRIPTION: Renders a blue line between points (400, 234) and (264, 17).
; PLAN: r0=400(x1), r1=234(y1), r2=264(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 234
LDI r2, 264
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
