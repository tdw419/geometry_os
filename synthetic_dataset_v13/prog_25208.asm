; DESCRIPTION: Draws a black line from (84, 178) to (491, 52).
; PLAN: r0=84(x1), r1=178(y1), r2=491(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 178
LDI r2, 491
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
