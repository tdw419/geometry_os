; DESCRIPTION: Places a yellow line segment connecting (384, 62) to (48, 229).
; PLAN: r0=384(x1), r1=62(y1), r2=48(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 62
LDI r2, 48
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
