; DESCRIPTION: Draws a black line from (80, 19) to (17, 30).
; PLAN: r0=80(x1), r1=19(y1), r2=17(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 19
LDI r2, 17
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
