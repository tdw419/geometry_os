; DESCRIPTION: Places a yellow line segment connecting (468, 181) to (294, 149).
; PLAN: r0=468(x1), r1=181(y1), r2=294(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 181
LDI r2, 294
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
