; DESCRIPTION: Places a yellow line segment connecting (299, 202) to (2, 212).
; PLAN: r0=299(x1), r1=202(y1), r2=2(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 202
LDI r2, 2
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
