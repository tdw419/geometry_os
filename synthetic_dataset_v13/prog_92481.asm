; DESCRIPTION: Places a red line segment connecting (412, 156) to (333, 212).
; PLAN: r0=412(x1), r1=156(y1), r2=333(x2), r3=212(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 156
LDI r2, 333
LDI r3, 212
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
