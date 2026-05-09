; DESCRIPTION: Places a red line segment connecting (347, 1) to (285, 198).
; PLAN: r0=347(x1), r1=1(y1), r2=285(x2), r3=198(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 1
LDI r2, 285
LDI r3, 198
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
