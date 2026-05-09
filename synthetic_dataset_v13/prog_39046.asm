; DESCRIPTION: Places a green line segment connecting (37, 62) to (220, 239).
; PLAN: r0=37(x1), r1=62(y1), r2=220(x2), r3=239(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 62
LDI r2, 220
LDI r3, 239
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
