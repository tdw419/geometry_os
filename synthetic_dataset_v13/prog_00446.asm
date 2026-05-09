; DESCRIPTION: Places a yellow line segment connecting (89, 25) to (384, 186).
; PLAN: r0=89(x1), r1=25(y1), r2=384(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 25
LDI r2, 384
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
