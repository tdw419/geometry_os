; DESCRIPTION: Places a yellow line segment connecting (504, 33) to (144, 197).
; PLAN: r0=504(x1), r1=33(y1), r2=144(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 33
LDI r2, 144
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
