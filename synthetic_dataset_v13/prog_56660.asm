; DESCRIPTION: Draws a black line from (469, 115) to (145, 239).
; PLAN: r0=469(x1), r1=115(y1), r2=145(x2), r3=239(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 115
LDI r2, 145
LDI r3, 239
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
