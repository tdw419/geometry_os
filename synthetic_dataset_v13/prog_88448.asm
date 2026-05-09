; DESCRIPTION: Places a yellow line segment connecting (17, 102) to (225, 108).
; PLAN: r0=17(x1), r1=102(y1), r2=225(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 102
LDI r2, 225
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
