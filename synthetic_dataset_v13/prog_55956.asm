; DESCRIPTION: Places a green line segment connecting (59, 117) to (232, 167).
; PLAN: r0=59(x1), r1=117(y1), r2=232(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 117
LDI r2, 232
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
