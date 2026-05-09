; DESCRIPTION: Places a yellow line segment connecting (71, 237) to (287, 168).
; PLAN: r0=71(x1), r1=237(y1), r2=287(x2), r3=168(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 237
LDI r2, 287
LDI r3, 168
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
