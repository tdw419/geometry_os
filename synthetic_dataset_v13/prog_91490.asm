; DESCRIPTION: Places a red line segment connecting (347, 198) to (367, 193).
; PLAN: r0=347(x1), r1=198(y1), r2=367(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 198
LDI r2, 367
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
