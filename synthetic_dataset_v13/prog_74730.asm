; DESCRIPTION: Places a yellow line segment connecting (347, 123) to (111, 182).
; PLAN: r0=347(x1), r1=123(y1), r2=111(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 123
LDI r2, 111
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
