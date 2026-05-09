; DESCRIPTION: Places a yellow line segment connecting (21, 147) to (107, 28).
; PLAN: r0=21(x1), r1=147(y1), r2=107(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 147
LDI r2, 107
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
