; DESCRIPTION: Draws a green line from (89, 52) to (347, 207).
; PLAN: r0=89(x1), r1=52(y1), r2=347(x2), r3=207(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 52
LDI r2, 347
LDI r3, 207
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
