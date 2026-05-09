; DESCRIPTION: Places a yellow line segment connecting (26, 26) to (208, 198).
; PLAN: r0=26(x1), r1=26(y1), r2=208(x2), r3=198(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 26
LDI r2, 208
LDI r3, 198
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
