; DESCRIPTION: Places a yellow line segment connecting (421, 231) to (0, 186).
; PLAN: r0=421(x1), r1=231(y1), r2=0(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 231
LDI r2, 0
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
