; DESCRIPTION: Places a yellow line segment connecting (310, 185) to (380, 222).
; PLAN: r0=310(x1), r1=185(y1), r2=380(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 185
LDI r2, 380
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
