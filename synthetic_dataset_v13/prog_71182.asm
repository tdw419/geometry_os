; DESCRIPTION: Draws a black line from (347, 36) to (193, 10).
; PLAN: r0=347(x1), r1=36(y1), r2=193(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 36
LDI r2, 193
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
