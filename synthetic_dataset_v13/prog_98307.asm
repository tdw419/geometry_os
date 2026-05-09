; DESCRIPTION: Places a black line segment connecting (81, 154) to (200, 160).
; PLAN: r0=81(x1), r1=154(y1), r2=200(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 154
LDI r2, 200
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
