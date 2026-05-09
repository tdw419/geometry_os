; DESCRIPTION: Draws a black line from (283, 18) to (447, 138).
; PLAN: r0=283(x1), r1=18(y1), r2=447(x2), r3=138(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 18
LDI r2, 447
LDI r3, 138
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
