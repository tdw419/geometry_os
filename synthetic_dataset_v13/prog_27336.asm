; DESCRIPTION: Draws a black line from (151, 239) to (472, 233).
; PLAN: r0=151(x1), r1=239(y1), r2=472(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 239
LDI r2, 472
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
