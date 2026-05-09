; DESCRIPTION: Places a green line segment connecting (0, 145) to (237, 198).
; PLAN: r0=0(x1), r1=145(y1), r2=237(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 145
LDI r2, 237
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
