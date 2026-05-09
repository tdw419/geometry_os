; DESCRIPTION: Places a yellow line segment connecting (276, 43) to (181, 210).
; PLAN: r0=276(x1), r1=43(y1), r2=181(x2), r3=210(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 43
LDI r2, 181
LDI r3, 210
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
