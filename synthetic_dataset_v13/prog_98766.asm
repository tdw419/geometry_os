; DESCRIPTION: Places a yellow line segment connecting (400, 198) to (130, 161).
; PLAN: r0=400(x1), r1=198(y1), r2=130(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 198
LDI r2, 130
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
