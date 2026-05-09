; DESCRIPTION: Places a yellow line segment connecting (54, 252) to (441, 173).
; PLAN: r0=54(x1), r1=252(y1), r2=441(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 252
LDI r2, 441
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
