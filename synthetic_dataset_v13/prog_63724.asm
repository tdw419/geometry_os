; DESCRIPTION: Draws a green line from (469, 5) to (347, 80).
; PLAN: r0=469(x1), r1=5(y1), r2=347(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 5
LDI r2, 347
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
