; DESCRIPTION: Places a green line segment connecting (129, 63) to (288, 24).
; PLAN: r0=129(x1), r1=63(y1), r2=288(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 63
LDI r2, 288
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
