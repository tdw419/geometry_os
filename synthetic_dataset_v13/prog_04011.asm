; DESCRIPTION: Places a green line segment connecting (206, 216) to (493, 63).
; PLAN: r0=206(x1), r1=216(y1), r2=493(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 216
LDI r2, 493
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
