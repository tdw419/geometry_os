; DESCRIPTION: Places a yellow line segment connecting (324, 175) to (222, 134).
; PLAN: r0=324(x1), r1=175(y1), r2=222(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 175
LDI r2, 222
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
