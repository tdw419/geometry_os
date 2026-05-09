; DESCRIPTION: Places a yellow line segment connecting (167, 225) to (509, 252).
; PLAN: r0=167(x1), r1=225(y1), r2=509(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 225
LDI r2, 509
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
