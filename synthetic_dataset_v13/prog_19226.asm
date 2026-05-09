; DESCRIPTION: Places a yellow line segment connecting (403, 63) to (423, 144).
; PLAN: r0=403(x1), r1=63(y1), r2=423(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 63
LDI r2, 423
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
