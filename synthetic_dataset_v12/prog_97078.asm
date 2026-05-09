; DESCRIPTION: Draws a black line from (278, 181) to (405, 128).
; PLAN: r0=278(x1), r1=181(y1), r2=405(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 181
LDI r2, 405
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
