; DESCRIPTION: Draws a black line from (254, 198) to (329, 87).
; PLAN: r0=254(x1), r1=198(y1), r2=329(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 198
LDI r2, 329
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
