; DESCRIPTION: Places a yellow line segment connecting (454, 180) to (288, 181).
; PLAN: r0=454(x1), r1=180(y1), r2=288(x2), r3=181(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 180
LDI r2, 288
LDI r3, 181
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
