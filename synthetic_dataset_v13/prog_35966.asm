; DESCRIPTION: Places a green line segment connecting (338, 127) to (347, 122).
; PLAN: r0=338(x1), r1=127(y1), r2=347(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 127
LDI r2, 347
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
