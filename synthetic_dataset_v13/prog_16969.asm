; DESCRIPTION: Places a yellow line segment connecting (164, 122) to (408, 4).
; PLAN: r0=164(x1), r1=122(y1), r2=408(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 122
LDI r2, 408
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
