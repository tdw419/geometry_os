; DESCRIPTION: Places a yellow line segment connecting (205, 167) to (436, 197).
; PLAN: r0=205(x1), r1=167(y1), r2=436(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 167
LDI r2, 436
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
