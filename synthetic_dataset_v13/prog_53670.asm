; DESCRIPTION: Places a green line segment connecting (148, 198) to (69, 86).
; PLAN: r0=148(x1), r1=198(y1), r2=69(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 198
LDI r2, 69
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
