; DESCRIPTION: Places a yellow line segment connecting (504, 141) to (348, 254).
; PLAN: r0=504(x1), r1=141(y1), r2=348(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 141
LDI r2, 348
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
