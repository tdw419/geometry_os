; DESCRIPTION: Places a green line segment connecting (183, 198) to (395, 246).
; PLAN: r0=183(x1), r1=198(y1), r2=395(x2), r3=246(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 198
LDI r2, 395
LDI r3, 246
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
