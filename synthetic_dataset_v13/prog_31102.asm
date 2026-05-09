; DESCRIPTION: Places a green line segment connecting (229, 112) to (442, 198).
; PLAN: r0=229(x1), r1=112(y1), r2=442(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 112
LDI r2, 442
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
