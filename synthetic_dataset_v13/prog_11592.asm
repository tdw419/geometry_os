; DESCRIPTION: Places a yellow line segment connecting (501, 212) to (246, 91).
; PLAN: r0=501(x1), r1=212(y1), r2=246(x2), r3=91(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 212
LDI r2, 246
LDI r3, 91
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
