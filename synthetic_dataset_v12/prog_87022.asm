; DESCRIPTION: Places a yellow line segment connecting (234, 133) to (460, 248).
; PLAN: r0=234(x1), r1=133(y1), r2=460(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 133
LDI r2, 460
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
