; DESCRIPTION: Places a yellow line segment connecting (382, 13) to (141, 237).
; PLAN: r0=382(x1), r1=13(y1), r2=141(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 13
LDI r2, 141
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
